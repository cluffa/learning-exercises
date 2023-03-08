function combinations_in_cage(s, c, r = [])
    all_combs = [[]]
    for elem in 1:9, j in eachindex(all_combs)
        push!(all_combs, [all_combs[j] ; elem])
    end
    combinations = filter(xs -> length(xs) == c && sum(xs) == s, all_combs) |> sort
    return length(r) == 0 ? combinations : filter(xs -> all(x -> x ∉ r, xs), combinations)
end
