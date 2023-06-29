%% This is the main run file for optimised IndLin solver on the non-stiff Van der Pol
%-------------------------------------------------------------------------

%  Original model is based on:
%  Sharif S, Hasegawa C, Duffull SB(2022)
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

% Step 1.  Optimise Van der Pol system utilising the two steps optimised IL

% stage 1. the stopping rule, RelEr
% stage 2. the adaptive step size based on dydt
%-------------------------------------------------------------------------
%%  calling files
clc
clear all
Getsolutionode
GetInitials1
I = eye(2);

%% IndLin solver
tic
for Loop1=1:maxLin
    
    %% ME solution
    for Loop2=1:length(time)
        
        %% Adaptive step size
        
        if Loop2>=length(time1)+length(time)-(length(time1)+length(time2))
            StepSize=StepArray(1);
            
        elseif Loop2>=length(time2)+length(time)-(length(time2)+length(time3))
            StepSize=StepArray(2);
            
        elseif Loop2>=length(time3)+length(time)-(length(time3)+length(time4))
            StepSize=StepArray(3);
            
        elseif Loop2>=length(time4)+length(time)-(length(time4)+length(time5))
            StepSize=StepArray(4);
            
        elseif Loop2>=length(time5)+length(time)-(length(time5)+length(time6))
            StepSize=StepArray(5);
            
        elseif Loop2>=length(time6)+length(time)-(length(time6)+length(time7))
            StepSize=StepArray(6);
            
        elseif Loop2>=length(time7)+length(time)-(length(time7)+length(time8))
            StepSize=StepArray(7);
            
        elseif Loop2>=length(time8)+length(time)-(length(time8)+length(time9))
            StepSize=StepArray(8);
            
        elseif Loop2>=length(time9)+length(time)-(length(time9)+length(time10))
            StepSize=StepArray(9);
            
        elseif Loop2>=length(time10)+length(time)-(length(time10)+length(time11))
            StepSize=StepArray(10);
            
        elseif Loop2>=length(time11)+length(time)-(length(time11)+length(time12))
            StepSize=StepArray(11);
            
        elseif Loop2>=length(time12)+length(time)-(length(time12)+length(time13))
            StepSize=StepArray(12);
            
        elseif Loop2>=length(time13)+length(time)-(length(time13)+length(time14))
            StepSize=StepArray(13);
            
        elseif Loop2>=length(time14)+length(time)-(length(time14)+length(time15))
            StepSize=StepArray(14);
            
        elseif Loop2>=length(time15)+length(time)-(length(time15)+length(time16))
            StepSize=StepArray(15);
            
        elseif Loop2>=length(time16)+length(time)-(length(time16)+length(time17))
            StepSize=StepArray(16);
            
        elseif Loop2>=length(time17)+length(time)-(length(time17)+length(time18))
            StepSize=StepArray(17);
            
        elseif Loop2>=length(time18)+length(time)-(length(time18)+length(time19))
            StepSize=StepArray(18);
            
        elseif Loop2>=length(time19)+length(time)-(length(time19)+length(time20))
            StepSize=StepArray(19);
            
        elseif Loop2>=length(time20)+length(time)-(length(time20)+length(time21))
            StepSize=StepArray(20);
            
        elseif Loop2<=length(time21)+length(time)-(length(time21)+length(time22))
            StepSize=StepArray(21);
            
        elseif Loop2>=length(time22)+length(time)-(length(time22)+length(time23))
            StepSize=StepArray(22);
            
        elseif Loop2>=length(time23)+length(time)-(length(time23)+length(time24))
            StepSize=StepArray(23);
            
        elseif Loop2>=length(time24)+length(time)-(length(time24)+length(time25))
            StepSize=StepArray(24);
            
        elseif Loop2>=length(time25)+length(time)-(length(time25)+length(time26))
            StepSize=StepArray(25);
            
        elseif Loop2>=length(time26)+length(time)-(length(time26)+length(time27))
            StepSize=StepArray(26);
            
        elseif Loop2>=length(time27)+length(time)-(length(time27)+length(time28))
            StepSize=StepArray(27);
            
        elseif Loop2>=length(time28)+length(time)-(length(time28)+length(time29))
            StepSize=StepArray(28);
            
        elseif Loop2>=length(time29)+length(time)-(length(time29)+length(time30))
            StepSize=StepArray(29);
            
        elseif Loop2>=length(time30)+length(time)-(length(time30)+length(time30))
            StepSize=StepArray(30);
            
        elseif Loop2>=length(time31)+length(time)-(length(time31)+length(time32))
            StepSize=StepArray(31);
            
        elseif Loop2>=length(time32)+length(time)-(length(time32)+length(time33))
            StepSize=StepArray(32);
            
        elseif Loop2>=length(time33)+length(time)-(length(time33)+length(time34))
            StepSize=StepArray(33);
            
        elseif Loop2>=length(time34)+length(time)-(length(time34)+length(time35))
            StepSize=StepArray(34);
            
        elseif Loop2>=length(time35)+length(time)-(length(time35)+length(time36))
            StepSize=StepArray(35);
            
        elseif Loop2>=length(time36)+length(time)-(length(time36)+length(time37))
            StepSize=StepArray(36);
            
        elseif Loop2>=length(time37)+length(time)-(length(time37)+length(time38))
            StepSize=StepArray(37);
            
        elseif Loop2>=length(time38)+length(time)-(length(time38)+length(time39))
            StepSize=StepArray(38);
            
        elseif Loop2>=length(time39)+length(time)-(length(time39)+length(time40))
            StepSize=StepArray(39);
            
        elseif Loop2>=length(time40)+length(time)-(length(time40)+length(time41))
            StepSize=StepArray(40);
            
        elseif Loop2>=length(time41)+length(time)-(length(time41)+length(time42))
            StepSize=StepArray(41);
            
        elseif Loop2>=length(time42)+length(time)-(length(time42)+length(time43))
            StepSize=StepArray(42);
            
        elseif Loop2>=length(time43)+length(time)-(length(time43)+length(time44))
            StepSize=StepArray(43);
            
        elseif Loop2>=length(time44)+length(time)-(length(time44)+length(time45))
            StepSize=StepArray(44);
            
        elseif Loop2>=length(time45)+length(time)-(length(time45)+length(time46))
            StepSize=StepArray(45);
            
        elseif Loop2>=length(time46)+length(time)-(length(time46)+length(time47))
            StepSize=StepArray(46);
            
        elseif Loop2>=length(time47)+length(time)-(length(time47)+length(time48))
            StepSize=StepArray(47);
            
        elseif Loop2<length(time48)+length(time)-(length(time48)+length(time48))
            StepSize=StepArray(48);
            
        end
        
        
        y1_New=-y0_update(Loop2);
        y1_new=y1_New.*y1_New;
        y2_new=k*y0_update(Loop2)-k*(y0_update(Loop2));
        
        K=[0          1
            -1         k-(k*y1_new)];
        
        
        [P_m,Lam_m]=eig(K);
        Pinv=inv(P_m);
        MPart=P_m* (exp(Lam_m*StepSize).*I) * Pinv;
        
        if Loop2==1
            y_me =MPart*y0';
        else
            y_me = MPart*y_me_prev;
        end
        
        y_me_prev=y_me;
        
        y0_new(Loop2,:)=y_me;
        
    end
    y0_update=y0_new;
    
    %% stopping rule
    
    y0_update=real(y0_new);
    y0_keep{Loop1,:}=y0_update;
    
    if Loop1>1
        
        RelEr=(max(abs(y0_update-y0_keep{Loop1-1,:})./y0_update));
        
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
xlabel('Time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(1)','FontSize',12,'FontWeight','bold');
legend(['ode45'],['IndLin;','','Adaptive-ss',',',sprintf('\\alpha= %g',alpha)]);
set(gca,'FontWeight','bold','fontsize',12)
h=subplot(1,2,2);

plot(t,c_ode(:,2),'g','LineWidth',2);
hold on
plot(time, y0_update(:,2),'b','LineWidth',1)
ylim([-3 3])
xlim([0 30])
xlabel('Time (hour)','FontSize',12,'FontWeight','bold');
ylabel('y(2)','FontSize',12,'FontWeight','bold');
legend(['ode45'],['IndLin;','','Adaptive-ss',',',sprintf('\\alpha= %g',alpha)]);
set(gca,'FontWeight','bold','fontsize',12)

