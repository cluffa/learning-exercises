"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    counts = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for nuc in strand
        if nuc ∈ keys(counts)
            counts[nuc] += 1
        else
            throw(DomainError(nuc, "not a valid nucleotide"))
        end
    end

    return counts
end
