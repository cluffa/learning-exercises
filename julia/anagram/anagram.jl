toDict(word) = word |>
        lowercase |>
        collect |>
        chars -> Dict(c => count(c .== chars) for c in chars)

function detect_anagrams(subject, candidates)
    candidates = candidates[lowercase(subject) .!= lowercase.(candidates)]
    candicts = toDict.(candidates)
    matches = Set((toDict(subject),)) ∩ Set(candicts)
    if length(matches) > 0
        candidates[matches .== candicts] |> unique
    else
        []
    end
end

# @bwasty
function _detect_anagrams(subject, candidates)
    hash = sort ∘ collect ∘ lowercase
    filter(candidates) do cand
        lowercase(subject) ≠ lowercase(cand) && hash(subject) == hash(cand)
    end
end
