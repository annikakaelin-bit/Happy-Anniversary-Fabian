data = 'pullPromt.csv'


fh = fopen('fabian-annika.txt','r')
oldTitle = fgetl(fh)
oldQuote = fgetl(fh)
oldFilename = fgetl(fh)
fclose(fh)


[title, quote, filename] = pullPromt(data)

if quote == oldQuote && title == oldTitle && filename == oldFilename
    [title, quote, filename] = pullPromt(data)
end