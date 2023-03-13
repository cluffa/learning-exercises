# returns func that counts bombs in 3x3 window
function window(minefield)
    size = (length(minefield), length(minefield[1]))
    (i, j) -> begin
        rows = max(1, i - 1):min(size[1], i + 1)
        cols = max(1, j - 1):min(size[2], j + 1)
        minefield[rows] .|>
            (x -> x[cols]) |>
            (x -> vcat(x...)) |>
            (x -> count(x .== '*')) |>
            (n -> Char('0' + n))
    end
end

function annotate(minefield)
    if length(minefield) == 0
        return minefield
    end

    minefield = minefield .|> x -> collect.(x)
    winfunc = window(minefield)

    for i in 1:length(minefield), j in 1:length(minefield[1])
        if minefield[i][j] != '*'
            count = winfunc(i, j)
            minefield[i][j] = count == '0' ? ' ' : count
        end
    end

    minefield .|> String
end


