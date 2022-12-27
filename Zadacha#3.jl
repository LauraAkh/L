#3
function mark_area!(r::Robot)
    steps_back = get_left_down_angle!(r)
    putmarker!(r)
    while !isborder(r, Ost)
        putmarkers_until_border!(r,Nord)
        move!(r, Ost)
        putmarker!(r)
        putmarkers_until_border!(r, Sud)
    end
    get_left_down_angle!(r)
    get_back!(r, steps_back)
end
function get_left_down_angle!(r::Robot)::NTuple{2, Int}
    steps_to_left_border = move_until_border!(r, West)
    steps_to_down_border = move_until_border!(r, Sud)
    return (steps_to_down_border, steps_to_left_border)
end

function get_back!(r::Robot, steps_back::NTuple{2, Int})
    for (i, side) in enumerate((Nord, Ost))
        moves!(r, side, steps_back[i])
    end
end
function putmarkers_until_border!(r::Robot, side::HorizonSide)::Int
    steps = 0
    while !isborder(r, side) 
        move!(r, side)
        putmarker!(r)
        steps += 1
    end 
    return steps
end
function move_until_border!(r::Robot, side::HorizonSide)::Int
    steps = 0
    while !isborder(r, side)
        steps += 1
        move!(r, side)
    end
    return steps
end