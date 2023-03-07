"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    letters = Set("abcdefghijklmnopqrstuvwxyz")
    chars = Set(lowercase(input))
    return letters ⊆ chars
end

