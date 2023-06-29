%% This is the main run file forperiodicity of inductive solver (IndLin) on the non-stiff Van der Pol

%% optimising IndLin, for peridicity
clc
clear all

Getsolutionode
GetIndLinSolutionOneCycle
StepSize  = 0.01; 
maxTime=20;
time=[0:StepSize: maxTime];
y0_update2=y0_update;


for Loop1=1:N_iterations_linearisation
    tic
    for Loop2=1:length(time)
        
        
        y1_New=y0_update2(Loop2);
        y1_new=y1_New.*y1_New;
        y2_new=k*y0_update2(Loop2)-k*(y0_update2(Loop2));
        
        
        K=[0          1
            -1          k-(k*y1_new)];
        
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
    y0_update2=y0_new;
    
    %% stopping rule
    
    y0_update2=real(y0_new);
    y0_keep{Loop1,:}=y0_update2;
    
    if Loop1>1
        
        RelEr=(max(abs(y0_update2-y0_keep{Loop1-1,:})./y0_update2));
        
        if RelEr < tolRelEf
            
            break
        end
    end
end

PeriodictyTime=toc

hold on
subplot(1,2,1)
hold on

plot(time, y0_update2(:,1),'--k','LineWidth',1)
ylim([-3 3])
xlim([0 20])
hold off
xlabel('Time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(1) ','FontSize',12,'FontWeight','bold');
legend ('ode23s', 'IndLin; Adaptive-ss,\alpha=0.001','IndLin; Preiodicity-secondCycle')
set(gca,'FontWeight','bold','fontsize',12)

subplot(1,2,2)
hold on
plot(time, y0_update2(:,2),'--k','LineWidth',1)
ylim([-3 3])
xlim([0 20])
xlabel('Time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(2)','FontSize',12,'FontWeight','bold');
legend ('ode23s', 'IndLin; Adaptive-ss,\alpha=0.001','IndLin; Preiodicity-secondCycle')
set(gca,'FontWeight','bold','fontsize',12)


