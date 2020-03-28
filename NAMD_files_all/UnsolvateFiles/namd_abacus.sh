#!/bin/bash
#SBATCH -A cn4101
#SBATCH --qos=cn4101
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem-per-cpu=1024
#SBATCH --time=03:00:00

module add namd/2.12-multicore

mkdir -p /scratch/$USER

namd2 +p 8 +setcpuaffinity minimization_equilibration.conf > minimization_equilibration.log
namd2 +p 8 +setcpuaffinity production.conf > production.log

rsync -aP /scratch/$USER/production.dcd ada:/share1/$USER/

