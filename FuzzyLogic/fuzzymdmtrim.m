fuzzymdmfis=newfis('fuzzymdmfis');
fuzzymdmfis=addvar(fuzzymdmfis,'input','name delta',[0 3]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',1,'nomatch','trapmf',  [1 1.5 3 3]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',1,'match','trimf', [0 0 2]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','address delta',[0 5]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',2,'nomatch','trapmf',  [1.4 3.5 5 5]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',2,'match','trimf', [0 0 3.5]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','NI Edit distance',[0 9]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',3,'match','trapmf', [1.35 4 9 9]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',3,'nomatch','trimf', [0 0 5]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','Home Phone Number Edit distance',[0 11]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',4,'match','trapmf', [1 3 11 11]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',4,'nomatch','trimf', [0 0 3.9]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','Geographical distance',[0 1000]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',5,'differntlocation','trapmf', [25 25 1000 1000]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',5,'moved','trimf', [0 25 75]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',5,'identical','trimf', [0 0 50]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','Gender',[-1 1]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',6,'match','trapmf', [-0.2 0.2 1 1]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',6,'nomatch','trapmf',  [-1 -1 0 0.2]);
fuzzymdmfis=addvar(fuzzymdmfis,'output','Matching',[0 1]);
fuzzymdmfis=addmf(fuzzymdmfis,'output',1,'nomatch','trimf', [0 0 0.5]);
fuzzymdmfis=addmf(fuzzymdmfis,'output',1,'datasteward','trimf',  [0 0.5 1]);
fuzzymdmfis=addmf(fuzzymdmfis,'output',1,'automatch','trimf', [0.5 1 1]);

rules = [
2 2 2 0 0 1 3 1 1
2 2 0 0 3 1 3 1 1
2 2 0 0 0 1 3 1 1
2 0 2 0 0 1 3 1 1
2 1 1 0 0 0 2 1 1
1 0 2 0 0 1 2 1 1
1 2 0 2 0 1 2 1 1
1 2 0 0 3 0 2 1 1
0 1 2 0 0 1 2 1 1
0 1 0 2 -1 0 2 1 1
1 1 1 0 0 2 1 1 2
0 1 0 1 0 0 1 1 1
0 0 0 1 -3 2 2 1 1
0 0 1 1 0 2 1 1 1
0 1 0 0 -3 0 1 1 2
1 2 2 0 3 0 2 1 1
2 2 1 0 3 0 2 1 1
2 0 0 0 0 2 2 1 1
2 1 0 0 2 1 2 1 1];

fuzzymdmfis = addrule(fuzzymdmfis, rules);

