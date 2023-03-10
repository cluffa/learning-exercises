function isisogram(s)
    allunique(c for c in lowercase(s) if isletter(c))
end
