function wordcount(sentence)
    sentence |> 
        lowercase |>
        s -> split(s, r"[^a-z0-9']+") |>
        ws -> strip.(ws, ['\'']) |>
        ws -> Dict(w => count(w .== ws) for w in ws if w != "")
end
