function encode(s)
    length(s) == 0 && return ""
    out = ""
    count = 0
    current = s[1]
    for c in s
        if c == current
            count += 1
        else
            if count > 1
                out *= string(count)
            end
            out *= current
            count = 1
            current = c
        end
    end
    if count > 1
        out *= string(count)
    end
    out *= current
    return out
end

function decode(s)
    out = ""
    current_count = ""
    for c in s
        if isdigit(c)
            current_count *= c
        elseif current_count != ""
            out *= c ^ parse(Int, current_count, base=10)
            current_count = ""
        else
            out *= c
        end
    end
    return out
end
