%% The firts run of inductive solver (IndLin), for calculating dydt
%% Initials
Getparameters
TimeInitial

I = eye(2);
for j=1:length(time_init)
    
    
    y1_New_init=-y0_update_init(j);
    y1_new_init=y1_New_init.*y1_New_init;
    y2_new_init=k*y0_update_init(j)-k*(y0_update_init(j));
    
    %% Define EVD
    K=[0          1
        -1         k-(k*y1_new_init)];
    if K(2,2)==-Inf || isnan(K(2,2))
        K(2,2)=0;
    end
    
    [P_m,Lam_m]=eig(K);
    Pinv=inv(P_m);
    MPart=P_m* (exp(Lam_m*stepsize).*I) * Pinv;
    
     %% Calculate new initial values
    if j==1
        y_me_init = real(MPart*y0');
    else
        y_me_init = real(MPart*y_me_prev_init);
    end
    
    y_me_prev_init=y_me_init;
    
    y0_new_init(j,:)=y_me_init;
    dx(j,1)=y0_new_init(j,1);
    dy(j,1)=y0_new_init(j,2);
    
     %% Calculting stepsizes for each deltay and its time
    
    if j>=2
        deltax=(dx(j)-dx(j-1))./(time_init(j)-time_init(j-1));
        deltay=(dy(j)-dy(j-1))./(time_init(j)-time_init(j-1));
        alpha=0.03;
        StepSizeCalx=(alpha.*(abs(deltax)));
        StepSizeCaly=(alpha.*(abs(deltay)));
        TimeVector1= [time_init(j-1):StepSizeCalx:time_init(j)];
        TimeVector2= [time_init(j-1):StepSizeCaly:time_init(j)];
        dcdtx(j)=deltax;
        dcdty(j)=deltay;
        StepSizeVector1(j)=StepSizeCalx;
        StepSizeVector2(j)=StepSizeCaly;
        
        TimeNew1{j}=TimeVector1;
        TimeNew2{j}=TimeVector2;
        TimeVector1=cell2mat(TimeNew1);
        TimeVector2=cell2mat(TimeNew2);
        
    end
    
    
end

y0_update_init=real(y0_new_init);

StepSizeVector1(1)=[];
StepSizeVector2(1)=[];
TimeNew1(1)=[];
TimeNew2(1)=[];



