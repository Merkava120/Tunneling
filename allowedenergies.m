%% Find allowed energies
%Variables
m = 1;
hbar = 1;
V0 = 3;
a = 1;
%% 
%Energy must be less than V0
etau = 0.1;
E = 0:etau:V0 - etau;



l = sqrt(2.*m.*(V0 - E))/hbar;


figure;
hold on;
plot(E,l.*tan(l*a))
plot(E,sqrt(2*m*E)/hbar)
hold off;
xlabel Energy
ylabel Y
title ('Allowed Energies')



%% Transcendental for z
zmax = 10*pi;
zstep = 0.0001;
zsols = zeros(10000,1);
index = 1;
z0 = (a / hbar).*sqrt(2*m*V0);
tol=0.0001;
for ztest = 0:zstep:zmax
    if (abs(tan(ztest)-(sqrt((z0/ztest).^2)-1))<=tol)
        zsols(index)=ztest;
        index = index + 1;
    end
end


% Now can use zsols to get l
% First let's trim off the extra zeros from zsols
firstzeroindex = length(zsols);
for zval=1:1:length(zsols)
    if (zsols(zval)==0)
        firstzeroindex=zval;
        break
    end
end
zshortened=zsols(1:(firstzeroindex-1));

% now can get l
l = zshortened ./ a;

% and E comes from l
Evals = ((hbar * l).^2 ./ (2*m)) - V0;


%% Transmission Coefficients

T = ( 1 + (( (V0).^(2) ) ./ ( 4.*Evals.*(V0-Evals))) .* sinh( ((2.*a)./hbar) .* sqrt( 2.*m.*(V0-Evals) ) ).^2).^(-1)

R = 1-T

r = meshgrid(thick)

plot(Evals, T)
%x = 0:0.5:10
%t = 0:0.5:10
%plot(t, sinh(x))
%hold on
%plot(t,cosh(x))
%hold off
%legend ('sinh(x)', 'cosh(x)')

%% loop loop

thick = 0.1:0.2:1.1

for a = thick
zmax = 10*pi;
zstep = 0.0001;
zsols = zeros(10000,1);
index = 1;
z0 = (a / hbar).*sqrt(2*m*V0);
tol=0.0001;
for ztest = 0:zstep:zmax
    if (abs(tan(ztest)-(sqrt((z0/ztest).^2)-1))<=tol)
        zsols(index)=ztest;
        index = index + 1;
    end
end


% Now can use zsols to get l
% First let's trim off the extra zeros from zsols
firstzeroindex = length(zsols);
for zval=1:1:length(zsols)
    if (zsols(zval)==0)
        firstzeroindex=zval;
        break
    end
end
zshortened=zsols(1:(firstzeroindex-1));

% now can get l
l = zshortened ./ a;

% and E comes from l
Evalues = ((hbar * l).^2 ./ (2*m)) - V0;

T = ( 1 + (( (V0).^(2) ) ./ ( 4.*Evalues.*(V0-Evalues))) .* sinh( ((2.*a)./hbar) .* sqrt( 2.*m.*(V0-Evalues) ) ).^2).^(-1)

R = 1-T

end

plot(Evalues,T)
hold on
plot(Evalues,R)
hold off
title 'Tranmission and Reflection Probability Coefficients'
xlabel 'Energy Values'
ylabel 'Coefficients Values'
legend ('Transmission Probability', 'Reflection Probability')
xlim([0,20])

