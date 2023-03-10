distance(a, b) = length(a) != length(b) ?
    throw(ArgumentError("unequal length")) : map(≠, a, b) |> sum
