%% Testing infinite square well
%Jordan Grow, Russel Anderson, Mitchell Hilbig, McKenna Myckowiak
%Constants
m = 1;
hbar = 1;
a = 1;
%Plot for 10 n values
figure;
hold on;
for n = 1:10
%Choose a value for E
%n = 9;
E = (n^2*pi^2*hbar^2)/(2*m*a^2);
rhs_isw = @(t,u)[u(2); -(2*m*E)/hbar^2*u(1)];
rhs_bounds = @(ua,ub)[ua(1);ub(1)-a];
%create initial guess
rhs_guess = @(x)[sin(x);cos(x)];
xmesh = linspace(0,a,10);
solinit = bvpinit(xmesh,rhs_guess);
solution = bvp4c(rhs_isw,rhs_bounds,solinit);
%Normalize wavefunction
normfunc = solution.y(1,:)/norm(solution.y(1,:));
probability = normfunc.^2;
plot(solution.x,probability)
endg
xlabel("x")
ylabel("probability density")
legend("E0",'E1','E2',"E3","E4","E5","E6","E7","E8","E9")
title("Infinite square well hbar = 1, m = 1, a = 1")

%Plan:
%Develop models for the finite square well
%I'll work on making plots of the wavefunction for E < v0
%Mckenna works on transmission coefficients
%Russel works on E > v0
%Mitch works on plotting wave functions
