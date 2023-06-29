%% optimising inductive solver (IndLin), for onecycle
%% Initialise design variables
N_iterations_linearisation =20;
StepSize  = 0.001; % ME
maxTime=20;
time=[0:StepSize: maxTime];

tolRelEf =1e-6;
dose = 1;

%% Initial conditions
y0=[dose 0];
C0=zeros(size(time));

%% Get parametes
Getparameters

%% IndLin solution
I = eye(2);
y0_update=C0;
options=odeset('RelTol',1e-6);
[t c_ode]=ode23s(@MyFunction, [0 maxTime], [y0],options, k);

sol=ode23s(@MyFunction, [0 maxTime], [y0],options, k);

%% Inductive Linearisation solver
tic
for Loop1=1:N_iterations_linearisation 
    
    %% ME solution
    
    for Loop2=1:length(time)
        
        y1_New=-y0_update(Loop2);
        y1_new=y1_New.*y1_New;
        y2_new=k*y0_update(Loop2)-k*(y0_update(Loop2));
        
        
        
        K=[0          1
            -1          k-(k*y1_new)];
        
        if K(2,2)==-Inf
            K(2,2)=0;
        end
        
        [P_m,Lam_m]=eig(K);
        Pinv=inv(P_m);
        MPart=P_m* (exp(Lam_m*StepSize).*I) * Pinv;
        if Loop2==1
            y_me = MPart*y0';
        else
            y_me = MPart*y_me_prev;
        end
        y_me_prev=y_me +[0;y2_new*StepSize];
        y0_new(Loop2,:)=y_me;
    end
    
    y0_update=y0_new;
    y0_keep_Y1(:,Loop1) = y0_update(:,1);
    y0_keep_Y2(:,Loop1) = y0_update(:,2);
 %% stopping rule

    y0_update=real(y0_new);

    y0_keep_Y{Loop1,:}=y0_update;
    if Loop1>1

        RelEr=max(abs(y0_update-y0_keep_Y{Loop1-1,:})./y0_update);

        if RelEr < tolRelEf
            break
        end
    end  
end

OneCycle=toc 


%% plotting

figure(1)
hold on
subplot(1,2,1)
plot(t,c_ode(:,1),'r','LineWidth',2)
hold on

plot(time, y0_update(:,1),'--b','LineWidth',1)
ylim([-3 3])
xlim([0 40])
hold off
xlabel('Time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(1) ','FontSize',12,'FontWeight','bold');
legend(['ode23s'],['IndLin;','','N=', num2str(N_iterations_linearisation),'',';ss=',num2str(StepSize)]);
set(gca,'FontWeight','bold','fontsize',12)

subplot(1,2,2)
plot(t,c_ode(:,2),'g','LineWidth',2)
hold on
plot(time, y0_update(:,2),'--b','LineWidth',1)
ylim([-3 3])
xlim([0 40])

xlabel('Time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(2)','FontSize',12,'FontWeight','bold');
legend(['ode23s'],['IndLin;','','N=', num2str(N_iterations_linearisation),'',';ss=',num2str(StepSize)]);
set(gca,'FontWeight','bold','fontsize',12)



