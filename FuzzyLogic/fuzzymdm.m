fuzzymdmfis=newfis('fuzzymdmfis');
fuzzymdmfis=addvar(fuzzymdmfis,'input','name delta',[0 3]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',1,'nomatch','sigmf',[3.75 1.75]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',1,'match','sigmf',[-3.75 1.75]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','address delta',[0 5]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',2,'nomatch','sigmf',[2.5 3.0]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',2,'match','sigmf',[-2.5 3.0]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','NI Edit distance',[0 9]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',3,'match','sigmf',[20.0 2.0]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',3,'nomatch','sigmf',[-20.0 2.0]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','Home Phone Number Edit distance',[0 11]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',4,'match','sigmf',[20.0 2.0]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',4,'nomatch','sigmf',[-20.0 2.0]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','Geographical distance',[0 1000]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',5,'differntlocation','sigmf',[3.0 1.5]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',5,'moved','gaussmf',[20.0 25.0]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',5,'identical','sigmf',[-3 1.5]);
fuzzymdmfis=addvar(fuzzymdmfis,'input','Gender',[-1 1]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',6,'match','sigmf',[20 0]);
fuzzymdmfis=addmf(fuzzymdmfis,'input',6,'nomatch','sigmf',[-20 0]);
fuzzymdmfis=addvar(fuzzymdmfis,'output','Matching',[0 1]);
fuzzymdmfis=addmf(fuzzymdmfis,'output',1,'nomatch','gaussmf',[0.05 0]);
fuzzymdmfis=addmf(fuzzymdmfis,'output',1,'datasteward','gaussmf',[0.25 0.5]);
fuzzymdmfis=addmf(fuzzymdmfis,'output',1,'automatch','gaussmf',[0.05 1]);

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
