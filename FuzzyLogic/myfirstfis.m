% This is a simple m-file to create a linguistic variable 
% for age with three linguistic labels - young, middleaged 
% and old 
% the first statement creates a new FIS with string name test 
% and Matlab variable a. The FIS takes certain defaults which you can 
% ignore for the moment. 
a=newfis('basketball'); 
% This adds a variable called 'linguistic age' to the FIS which is 
% of type input and lies betheween 0 and 70 
a=addvar(a,'input','height',[0.75 2.5]); 
% We now add three membership functions associated with this variable. 
% We give them all an index of 1 (the third parameter) because this is 
% the first variable - read the help to understand more about the 
% parameters 
a=addmf(a,'input',1,'very short','gaussmf',[0.25 0.75]); 
a=addmf(a,'input',1,'short','gaussmf',[0.25 1.25]); 
a=addmf(a,'input',1,'average','gaussmf',[0.25 1.75]); 
a=addmf(a,'input',1,'tall','gaussmf',[0.25 2.25]); 
a=addmf(a,'input',1,'very tall','gaussmf',[0.25 2.5]); 
% male linguistic weight 
a=addvar(a,'input','goodatbasketball',[10 100]); 
a=addmf(a,'input',2,'very bad','gaussmf',[10 0]); 
a=addmf(a,'input',2,'bad','gaussmf',[10 25]); 
a=addmf(a,'input',2,'average','gaussmf',[10 50]);
a=addmf(a,'input',2,'good','gaussmf',[10 75]); 
a=addmf(a,'input',2,'average','gaussmf',[10 100]); 
subplot(311); plotmf(a,'input',1); xlabel('Height', 'FontSize', 8); ylabel('Degree of membership', 'FontSize', 8);
subplot(312); plotmf(a,'input',2); xlabel('Good at basketball', 'FontSize', 8); ylabel('Degree of membership', 'FontSize', 8);