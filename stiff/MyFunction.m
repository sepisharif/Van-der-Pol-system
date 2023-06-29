function dydt = Complete_equation(~,y,k)

% code the second order vander pol equation as a system of first order ode

dydt = [y(2);
k*y(2)-y(1)-k*y(1)*y(1)*y(2)];
    
  % thispart is the the first derivative of y(2) or second derevative of y which is the solution

end
