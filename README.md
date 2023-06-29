# Van der Pol system
Inductive Linearization solver on Van der Pol system

## Sepideh Sharif, 29/06/2023

The following code demonstrates how the Inductive Linearization (IndLin) technique outperforms the reference solver ode45 and ode23s.
 Original model and optimized solver is based on:
 Sharif S, Hasegawa C, Duffull SB(2022)

##  Some general information:

 Optimizing the Van der Pol system utilizing the two steps of the optimized IndLin
- Stage 1. the stopping rule, RelEr
- Stage 2. the adaptive step size based on dydt


There are two stes of codes in separet folders, for non-stiff and stiff Van der Pol system.

1- MainRun m.file contains all function files and provides access otehr m.files.

2- IndLin solves Van der Pol after two optimization steps; all optimization steps are coded in the MainRun.m file.

3- Dammping parameter for the Van der pol system was used as k=1 for the non-stiff and k=10 for the stiff system.

4- The threshold tol is defined as (tolRelEf) in the GetInitials1.m file, with a default value of 1e-6.

5- For both stiff and non-stiff systems, the ode solvers ode45, ode23s and optimized IndLin were utilized, the comparator metrics RunTime and graphycally visualization are compared.

 
1- The lines 202-215 of the MainRunNonStiff.m file denote Stopping rule. (the code could used to stop N or could be off to have the fixed N):


## Stopping rule code and its condition

RelEr=(max(abs(y0_update-y0_keep{Loop1-1,:})./y0_update));
        
        if RelEr < tolRelEf
            
            break


## Adaptive step size code

In the MainRunNonStiff.m file, the lines 28-174 indicate the adaptive step size corresponding to the time vectors in the GetInitials1.m file and the GetInitials2.m file, which are based on DCDT calculation of the rate of the change. (could be on\off to be applied or ignored).

## Periodicity of oscillator code

The MainRunPeriodicity.m file contains the code to show hoew calculating the first cycle of oscillator could enhance the Indlin solver performance and it could be dramatically usfull when the cycle number of the system goes to infinity.

The same procedure could be observed for the stiff system files.

