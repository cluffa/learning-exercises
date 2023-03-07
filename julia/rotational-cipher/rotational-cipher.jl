function rotate(rot::Int, char::Char)
    rot %= 26

    if char ∈ 'A':'Z' && char + rot > 'Z'
        rot += 'A' - 1 - 'Z'
    end

    if char ∈ 'a':'z' && char + rot > 'z'
        rot += 'a' - 1 - 'z'
    end

    return char + rot
end

function rotate(rot::Int, str::String)
    chars = collect(str)
    letters = isletter.(chars)
    chars[letters] .= rotate.(rot, chars[letters])
    return String(chars)
end