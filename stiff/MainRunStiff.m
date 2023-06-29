%% This is the main run file for optimised IndLin solver on the stiff Van der Pol
%-------------------------------------------------------------------------

%  Original model is based on:
%  Sharif S, Hasegawa C, Duffull SB(2022)
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

% Step 1.  Optimise Van der Pol system utilising the two steps optimised IL

% stage 1. the stopping rule, RelEr
% stage 2. the adaptive step size based on dydt
%-------------------------------------------------------------------------

%% calling files
clear
clc
clf
warning off
Getsolutionode
GetInitials1
I = eye(2);
tic
for Loop1=1:maxLin
    
    %% ME solution
    for Loop2=1:length(time)
        
        %% Adaptive step size
        
        
        if time(Loop2)<1
            StepSize=StepArray(1);
            
        elseif time(Loop2)<2
            StepSize=StepArray(2);
            
        elseif time(Loop2)<3
            StepSize=StepArray(3);
            
        elseif time(Loop2)<4
            StepSize=StepArray(4);
            
        elseif time(Loop2)<5
            StepSize=StepArray(5);
            
        elseif time(Loop2)<6
            StepSize=StepArray(6);
            
        elseif time(Loop2)<7
            StepSize=StepArray(7);
            
        elseif time(Loop2)<8
            StepSize=StepArray(8);
            
        elseif time(Loop2)<9
            StepSize=StepArray(9);
            
        elseif time(Loop2)<10
            StepSize=StepArray(10);
            
        elseif time(Loop2)<11
            StepSize=StepArray(11);
            
        elseif time(Loop2)<12
            StepSize=StepArray(12);
            
        elseif time(Loop2)<13
            StepSize=StepArray(13);
            
        elseif time(Loop2)<14
            StepSize=StepArray(14);
            
        elseif time(Loop2)<15
            StepSize=StepArray(15);
            
        elseif time(Loop2)<16
            StepSize=StepArray(16);
            
        elseif time(Loop2)<17
            StepSize=StepArray(17);
            
        elseif time(Loop2)<18
            StepSize=StepArray(18);
            
        elseif time(Loop2)<19
            StepSize=StepArray(19);
            
        elseif time(Loop2)<20
            StepSize=StepArray(20);
            
        elseif time(Loop2)<21
            StepSize=StepArray(21);
            
        elseif time(Loop2)<22
            StepSize=StepArray(22);
            
        elseif time(Loop2)<23
            StepSize=StepArray(23);
            
        elseif time(Loop2)<24
            StepSize=StepArray(24);
            
        elseif time(Loop2)<25
            StepSize=StepArray(25);
            
        elseif time(Loop2)<26
            StepSize=StepArray(26);
            
        elseif time(Loop2)<27
            StepSize=StepArray(27);
            
        elseif time(Loop2)<28
            StepSize=StepArray(28);
            
        elseif time(Loop2)<29
            StepSize=StepArray(29);
            
        elseif time(Loop2)<30
            StepSize=StepArray(30);
            
        elseif time(Loop2)<31
            StepSize=StepArray(31);
            
        elseif time(Loop2)<32
            StepSize=StepArray(32);
            
        elseif time(Loop2)<33
            StepSize=StepArray(33);
            
        elseif time(Loop2)<34
            StepSize=StepArray(34);
            
        elseif time(Loop2)<35
            StepSize=StepArray(35);
            
        elseif time(Loop2)<36
            StepSize=StepArray(36);
            
        elseif time(Loop2)<37
            StepSize=StepArray(37);
            
        elseif time(Loop2)<38
            StepSize=StepArray(38);
            
        elseif time(Loop2)<39
            StepSize=StepArray(39);
            
        elseif time(Loop2)<40
            StepSize=StepArray(40);
            
        elseif time(Loop2)<41
            StepSize=StepArray(41);
            
        elseif time(Loop2)<42
            StepSize=StepArray(42);
            
            
        elseif time(Loop2)<43
            StepSize=StepArray(43);
            
        elseif time(Loop2)<44
            StepSize=StepArray(44);
            
        elseif time(Loop2)<45
            StepSize=StepArray(45);
            
        elseif time(Loop2)<46
            StepSize=StepArray(46);
            
        elseif time(Loop2)<47
            StepSize=StepArray(47);
            
        elseif time(Loop2)<48
            StepSize=StepArray(48);
        end
        
        y1_New=-y0_update(Loop2);
        y1_new=y1_New.*y1_New;
        y2_new=k*y0_update(Loop2)-k*(y0_update(Loop2));
        
        
        
        K=[0          1
            -1          k-(k*y1_new)];
        
        if K(2,2)==-Inf ||isnan(K(2,2))
            K(2,2)=0;
        end
        
        
        [P_m,Lam_m]=eig(K);
        Pinv=inv(P_m);
        MPart=P_m* (exp(Lam_m*StepSize).*I) * Pinv;
        
        if Loop2==1
            y_me =MPart*y0';
        else
            y_me = real(MPart*y_me_prev);
        end
        
        y_me_prev=y_me;
        
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


time_Indlin=toc

%% Plotting
h=subplot(1,2,1);
plot(t,c_ode(:,1),'r','LineWidth',2)
hold on

plot(time, y0_update(:,1),'b','LineWidth',1)
ylim([-3 3])
xlim([0 30])
xlabel('time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(1)','FontSize',12,'FontWeight','bold');
legend(['ode23s'],['IndLin;','','Adaptive-ss',',','\alpha=0.03'],'FontSize',11,'FontWeight','bold');
set(gca,'FontWeight','bold','fontsize',12)
h=subplot(1,2,2);

plot(t,c_ode(:,2),'g','LineWidth',2);
hold on
plot(time, y0_update(:,2),'b','LineWidth',1)
ylim([-3 3])
xlim([0 30])
xlabel('time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(2)','FontSize',12,'FontWeight','bold');
legend(['ode23s'],['IndLin;','','Adaptive-ss',',','\alpha=0.03'],'FontSize',11,'FontWeight','bold');
set(gca,'FontWeight','bold','fontsize',12)

