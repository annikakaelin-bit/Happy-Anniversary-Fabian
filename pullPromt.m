function[title, quote, quoteimg] = pullPromt(data)
%% importing the correct data
fileID = fopen('Fabina&Annika','W');
    if fileID < 0
         error("Unable to open file: %s",msg);
    end
cells = readcell(data)

%%picking out a random cell

headers = cells(1,:)
rest = cells(2:end,:)
[r c] = size(rest)
amount = r*c

index = randi([1,amount])

%%pulling out the header of the cell
loc = index./(r-1)
loc = floor(loc)
if mod(index,r) ~= 0
    loc = loc + 1
end
title = [headers{1,loc}]

%% getting the data from the cell
quoteimg = 'heart.png';




quote = ''
if ~isempty([rest{index}]) & ischar([rest{index}])
    quote = [rest{index}]
else
    if index < amount
        index = index+1
    else
        index = index-1
    end
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