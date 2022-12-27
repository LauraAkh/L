#11
function num_horizontal_borders!(robot::Robot)
    back_path = move_to_angle!(robot)
    side = Ost
    num_borders = num_horizontal_borders!(robot, side)
    while !isborder(robot, Nord)
        move!(robot, Nord)
        side = inverse(side)
        num_borders += num_horizontal_borders!(robot, side)
    end
    move_to_angle!(robot)
    get_to_origin!(robot, back_path)
    return num_borders
end
function num_horizontal_borders!(robot, side)
    num_borders = 0
    state = 0 
    while !isborder(robot, side)
        move!(robot, side)
        if state == 0
            if isborder(robot, Nord) == true
                state = 1 
            end
        else 
            if isborder(robot, Nord) == false
                state = 0
                num_borders += 1
            end
        end
    end
    return num_borders
end
function move_to_angle!(robot::Robot)::NTuple{2, Int}
    steps_to_left_border = move_until_border!(robot, West)
    steps_to_down_border = move_until_border!(robot, Sud)
    return (steps_to_down_border, steps_to_left_border)
end
function move_until_border!(robot::Robot, side::HorizonSide)::Int
    n_steps = 0
    while !isborder(robot, side)
        n_steps += 1
        move!(robot, side)
    end
    return n_steps
end
function get_to_origin!(robot::Robot, steps_to_origin::NTuple{2, Int})
    for (i, side) in enumerate((Nord, Ost))
        moves!(robot, side, steps_to_origin[i])
    end
end
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+2, 4))
function moves!(robot::Robot, side::HorizonSide, n_steps::Int)
    for _ in 1:n_steps
        move!(robot, side)
    end
end