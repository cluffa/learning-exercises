c = Dict('G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
function to_rna(dna)
    if map(x -> x ∉ keys(c), collect(dna)) |> any
        throw(ErrorException("Invalid input"))
    end
    map(x -> c[x], dna) |> join
end
