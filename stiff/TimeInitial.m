%% Initials
dose = 1;
y0=[dose 0];
stepsize =0.01; 
minTime=0;
maxTime=48;
time_init=[minTime:1: maxTime];
c0_init=zeros(size(time_init));
y0_update_init=c0_init;