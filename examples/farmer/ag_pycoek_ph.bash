#!/bin/bash



#python agnostic_cylinders.py --help

#mpiexec -np 3 python -m mpi4py farmer_pycoek_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=5 --xhatshuffle --lagrangian --rel-gap 0.01

#mpiexec -np 3 python -m mpi4py agnostic_pycoek_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=5 --xhatshuffle --lagrangian --rel-gap 0.01

#python agnostic_pycoek_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=2 

#mpiexec -np 2 python -m mpi4py agnostic_pycoek_cylinders.py --num-scens 3 --default-rho 1 --solver-name cplex --max-iterations=10 --lagrangian --rel-gap 0.01

(time python agnostic_pycoek_ph.py --num-scens 3 --default-rho 1 --solver-name appsi_coek_gurobi --max-iterations=10 --crops-multiplier 100000) > timing/pycoek.out 2>&1

#time python agnostic_pycoek_ph.py --num-scens 3 --default-rho 1 --solver-name appsi_coek_gurobi --max-iterations=10 --crops-multiplier 100000

#python agnostic_pycoek_ph.py --num-scens 3 --default-rho 1 --solver-name appsi_coek_gurobi --max-iterations=1 --crops-multiplier 100000

