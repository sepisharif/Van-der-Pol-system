%% ode23s solution
%% Initials
Getparameters
dose = 1;
y0=[dose 0];
minTime=0;
maxTime=48;

%% ode23s solution
tic
options=odeset('RelTol',1e-6);
[t c_ode]=ode23s(@MyFunction, [0 maxTime], [y0],options, k);
time_ode=toc
