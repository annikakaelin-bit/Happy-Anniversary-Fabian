function[title, quote, quoteimg] = pullPromt(data)
%% importing the correct data
fileID = fopen('fabian-annika.txt','W');
    if fileID < 0
         error("Unable to open file: %s",msg);
    end
% Use a simple CSV reader for Octave compatibility
fid = fopen(data);
cells = {};
row = 1;
while ~feof(fid)
    line = fgetl(fid);
    if ischar(line)
        parts = strsplit(line, ',');
        cells(row,:) = parts;
        row = row + 1;
    end
end
fclose(fid);

%%picking out a random cell

headers = cells(1,:)
rest = cells(2:end,:)
[r c] = size(rest)
amount = r*c

index = randi([1,amount])
if isempty(rest{index})
    if index < amount
        index = index+1
    else
        index = index-1
    end
end
%%pulling out the header of the cell
loc = index./(r)
loc = ceil(loc)
title = [headers{1,loc}]

%% getting the data from the cell
quoteimg = 'heart.png';

quote = ''
if ~isempty([rest{index}]) & ischar([rest{index}])
    quote = [rest{index}]
end

%%making the files
if loc == 2     %%saving the file as an image
    quoteimg = [rest{index}]
    quote = 'love you ;)'
    
end

info = [{title} {quote} {quoteimg}]
for i = 1:length(info)
    fprintf(fileID,[info{i} '\n'])
end


fclose(fileID);

end

