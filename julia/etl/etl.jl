function transform(input::AbstractDict)
    merge(Dict.(lowercase.(v) .=> k for (k, v) in input)...)
end
