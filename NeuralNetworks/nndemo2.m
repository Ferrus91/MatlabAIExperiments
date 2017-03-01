%close all plots
close all ;
%Define the function to approximate
i = 9;
P = -2:(.4/i):2;
T = 1 + sin(pi*P/4);
net = newff(minMaxVal,[5 1],{'tansig' 'purelin'});
%Here the network is simulated and its output plotted against the targets
net.trainParam.epochs = 500;
net = train(net, P,T);
Y = sim( net ,P) ;
figure(3);
plot(P,T,'b+',P,Y,'ro');
title('Function approximation after learning');
mse = mean((Y-T).^2);
