data = 'pullPromt.csv'
time = clock
day = time(3)
if day ~= daylast
    daylast = 0
else
    [title, quote, filename] = pullPromt(data)
    timelast = clock
    daylast = timelast(3)
end
