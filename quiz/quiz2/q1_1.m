hIntensity = @(d) 1./d.^2;
lIntensity = @(z, d) exp(-(z * ones(size(d)) ./ hIntensity(d) - 1).^2 / 0.2);
pGreenDots=[ -9 1 -1 9 ; 5 5 -5 -5 ]; 
pRedDots = [ -1 9 -9 1 ; 5 5 -5 -5 ]; 
pBlueDot = [ 12 ; -8];
iGreen = 0.0042; iRed = 0.0026;
%%%%%%%%%%% PLEASE DON'T CHANGE ANYTHING ABOVE THIS LINE %%%%%%%%%%%

belPrior = [0.25;0.25;0.25;0.25] ;
dist_green = vecnorm(pGreenDots - pBlueDot)'
dist_red = vecnorm(pRedDots - pBlueDot)'

belAfterGreen = belPrior .*lIntensity(iGreen, dist_green);
belAfterGreen = belAfterGreen/ sum(belAfterGreen)
belAfterRed = belAfterGreen .*lIntensity(iRed, dist_red);
belAfterRed = belAfterRed/ sum(belAfterRed)

plotMarkovLocalization(belPrior, belAfterGreen, belAfterRed);
