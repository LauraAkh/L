#20
function putmarker_at_border_and_back!(r::Robot, side::HorizonSide, steps::Int = 0)
    if !isborder(r, side)
        move!(r, side)
        steps += 1
        putmarker_at_border_and_back!(r, side, steps)
    else
        putmarker!(r)
        along!(r, inverse_side(side), steps)
    end
end

function along!(r, side, num_steps)
    steps = 0
    while !isborder(robot, side) && steps < num_steps
        move!(r, side)
        steps += 1
    end
end

function move!(r::Robot, sides::NTuple{2, HorizonSide})
    for side in sides
        move!(r, side)
    end
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end