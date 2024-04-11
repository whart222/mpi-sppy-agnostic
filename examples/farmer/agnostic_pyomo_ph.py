# This software is distributed under the 3-clause BSD License.
# Started by dlw Aug 2023

import farmer_pyomo_agnostic
from mpisppy.spin_the_wheel import WheelSpinner
import mpisppy.utils.cfg_vanilla as vanilla
import mpisppy.utils.config as config
import mpisppy.utils.agnostic as agnostic

def _farmer_parse_args():
    # create a config object and parse JUST FOR TESTING
    cfg = config.Config()

    farmer_pyomo_agnostic.inparser_adder(cfg)

    cfg.popular_args()
    cfg.two_sided_args()
    cfg.ph_args()    
    cfg.aph_args()    
    cfg.xhatlooper_args()
    cfg.fwph_args()
    cfg.lagrangian_args()
    cfg.lagranger_args()
    cfg.xhatshuffle_args()

    cfg.parse_command_line("farmer_pyomo_agnostic_cylinders")
    return cfg


if __name__ == "__main__":
    farmer_pyomo_agnostic.timer.start("main")
    farmer_pyomo_agnostic.timer.start("pre_solve")
    print("begin ad hoc main for agnostic.py")

    cfg = _farmer_parse_args()
    Ag = agnostic.Agnostic(farmer_pyomo_agnostic, cfg)

    scenario_creator = Ag.scenario_creator
    scenario_denouement = farmer_pyomo_agnostic.scenario_denouement   # should we go though Ag?
    all_scenario_names = ['scen{}'.format(sn) for sn in range(cfg.num_scens)]

    # Things needed for vanilla cylinders
    beans = (cfg, scenario_creator, scenario_denouement, all_scenario_names)

    # Vanilla PH hub
    hub_dict = vanilla.ph_hub(*beans,
                              scenario_creator_kwargs=None,  # kwargs in Ag not here
                              ph_extensions=None,
                              ph_converger=None,
                              rho_setter = None)
    # pass the Ag object via options...
    hub_dict["opt_kwargs"]["options"]["Ag"] = Ag

    Ag.quiet = True         # Is there a better place to pass in "other" options?
    hub_dict["opt_kwargs"]["options"]["display_progress"] = True
    hub_dict["opt_kwargs"]["options"]["verbose"] = False
    hub_dict["opt_kwargs"]["options"]["display_timing"] = False

    ph = hub_dict["opt_class"](**hub_dict["opt_kwargs"])

    farmer_pyomo_agnostic.timer.stop("pre_solve")
    farmer_pyomo_agnostic.timer.start("ph")
    conv, obj, triv = ph.ph_main()
    farmer_pyomo_agnostic.timer.stop("ph")
    farmer_pyomo_agnostic.timer.start("post_solve")
    # Obj includes prox (only ok if we find a non-ant soln)
    if (conv < 1e-8):
        print(f'Objective value: {obj:.2f}')
    else:
        print('Did not find a non-anticipative solution '
             f'(conv = {conv:.1e})')
    
    ph.post_solve_bound(verbose=False)
    farmer_pyomo_agnostic.timer.stop("post_solve")
    farmer_pyomo_agnostic.timer.stop("main")
    print(farmer_pyomo_agnostic.timer)
    farmer_pyomo_agnostic.timer.timers["main"].flatten()
    print(farmer_pyomo_agnostic.timer)
