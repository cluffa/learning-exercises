score_dict = Dict([
    "aeioulnrst" |> collect .=> 1
    "dg" |> collect .=> 2
    "bcmp" |> collect .=> 3
    "fhvwy" |> collect .=> 4
    "k" |> collect .=> 5
    "jx" |> collect .=> 8
    "qz" |> collect .=> 10
])

score_letter(x) = get(score_dict, x, 0)

function score(str)
    str == "" ? 0 :
        str |>
        lowercase |>
        collect .|>
        score_letter |>
        sum
end
