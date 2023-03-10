mutable struct Robot
    name::String
end

name_set = Set(String([l1, l2, d1, d2, d3]) for l1 in 'A':'Z', l2 in 'A':'Z', d1 in '0':'9', d2 in '0':'9', d3 in '0':'9')
pick_name!(set) = pop!(set)
Robot() = Robot(pick_name!(name_set))

function reset!(instance::Robot)
    instance.name = pick_name!(name_set)
end

function name(instance::Robot)
    instance.name
end