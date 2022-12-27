#2
function mark_square!(r::Robot)
    steps_to_left_down_angle = [0, 0] 
    steps_to_left_down_angle[1] = move_until_border!(r, Sud)
    steps_to_left_down_angle[2] = move_until_border!(r, West)
    for side in (Nord, Ost, Sud, West)
        putmarkers_until_border!(r, side)
    end
    moves!(r, Ost, steps_to_left_down_angle[2])
    moves!(r, Nord, steps_to_left_down_angle[1])
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
function moves!(r::Robot, side::HorizonSide, steps::Int)
    for _ in 1:steps
        move!(r, side)
    end
end