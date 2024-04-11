#!/bin/bash -v



#python agnostic_cylinders.py --help

#mpiexec -np 3 python -m mpi4py farmer_pyomo_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=5 --xhatshuffle --lagrangian --rel-gap 0.01

#mpiexec -np 3 python -m mpi4py agnostic_pyomo_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=5 --xhatshuffle --lagrangian --rel-gap 0.01

#python agnostic_pyomo_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=2 

#mpiexec -np 2 python -m mpi4py agnostic_pyomo_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=10 --lagrangian --rel-gap 0.01

# TODO: gurobi_persistent

#(time python agnostic_pyomo_ph.py --num-scens 30 --default-rho 1 --solver-name gurobi --max-iterations=100 --crops-multiplier 100) > timing/gurobi.out 2>&1
#(time python agnostic_pyomo_ph.py --num-scens 30 --default-rho 1 --solver-name gurobi_direct --max-iterations=100 --crops-multiplier 100) > timing/gurobi_direct.out 2>&1
#(time python agnostic_pyomo_ph.py --num-scens 30 --default-rho 1 --solver-name gurobi_v2 --max-iterations=100 --crops-multiplier 100) > timing/gurobi_v2.out 2>&1
#(time python agnostic_pyomo_ph.py --num-scens 30 --default-rho 1 --solver-name appsi_gurobi --max-iterations=100 --crops-multiplier 100) > timing/appsi_gurobi.out 2>&1

#(time python agnostic_pyomo_ph.py --num-scens 3 --default-rho 1 --solver-name gurobi --max-iterations=10 --crops-multiplier 100000) > timing/gurobi.out 2>&1
#(time python agnostic_pyomo_ph.py --num-scens 3 --default-rho 1 --solver-name gurobi_direct --max-iterations=10 --crops-multiplier 100000) > timing/gurobi_direct 2>&1

(time python agnostic_pyomo_ph.py --num-scens 3 --default-rho 1 --solver-name appsi_gurobi --max-iterations=10 --crops-multiplier 100000) > timing/appsi_gurobi.out 2>&1

#(time python agnostic_pyomo_ph.py --num-scens 3 --default-rho 1 --solver-name gurobi_v2 --max-iterations=10 --crops-multiplier 100000) > timing/gurobi_v2.out 2>&1

#python agnostic_pyomo_ph.py --num-scens 3 --default-rho 1 --solver-name gurobi_v2 --max-iterations=10 --crops-multiplier 10

#python agnostic_pyomo_ph.py --num-scens 3 --default-rho 1 --solver-name appsi_gurobi --max-iterations=10 --crops-multiplier 100000
