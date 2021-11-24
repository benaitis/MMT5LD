function [t,y] = Euler(f,tspan,y0,N,varargin)
%Euler’s method to solve vector differential equation y’(t) = f(t,y(t))
% for tspan = [t0,tf] and with the initial value y0 and N time steps
if nargin<4 | N <= 0, N = 100; end
if nargin<3, y0 = 0; end
h = (tspan(2) - tspan(1))/N; %stepsize
t = tspan(1)+[0:N]'*h; %time vector
y(1,:) = y0(:)'; %always make the initial value a row vector
for k = 1:N
    y(k + 1,:) = y(k,:) +h*feval(f,t(k),y(k,:),varargin{:}); %Eq.(6.1.7)
end