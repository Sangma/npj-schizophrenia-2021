subjectlist = textread('list.txt','%s');
thlist=[0.05 0.20];
thname={'05','20'};
for i = 1:1:length(subjectlist)
    disp(subjectlist{i});
    cd(subjectlist{i});
    tractlist = textread('tractlist.txt','%s');
    for tractindex = 1:1:length(tractlist);
        cd(tractlist{tractindex});
	cd tracts;
	for j = 1:1:2
            data = load_untouch_nii('tractsNorm.nii.gz');
	    sh = find(data.img>0);
	    maskdata=data.img(sh);
	    tempdata = sort(maskdata,'descend');
	    thvalue = tempdata(ceil(length(sh)*thlist(j)));
	    sh2 = find(data.img>thvalue);
	    data.img(sh2) = 1;
	    sh3 = find(data.img<1);
	    data.img(sh3) = 0;
	    filename=strcat('tractsNormp',thname{j},'.nii.gz');
	    save_untouch_nii(data,filename);
	end
	cd ..
	cd ..
    end
    cd ..
end
