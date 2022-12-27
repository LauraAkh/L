#4
import HorizonSideRobots.move!
function cross_X!(r::Robot) 
    sides = (Nord, Ost, Sud, West)
    for i in 1:4
        first_side = sides[i]
        second_side = sides[i % 4 + 1]
        direction = (first_side, second_side)
        steps = putmarkers_until_border!(r, direction)
        moves!(r, inverse_side(direction), steps)
    end
    putmarker!(r)
end

function putmarkers_until_border!(r::Robot, sides::NTuple{2, HorizonSide})::Int
    steps = 0
    while !isborder(r, sides[1]) && !isborder(r, sides[2])
        steps += 1
        move!(r, sides)
        putmarker!(r)
    end
    return steps
end

function moves!(r::Robot, sides::NTuple{2, HorizonSide}, steps::Int)
    for _ in 1:steps
        move!(r, sides)
    end
end

function move!(r::Robot, sides::NTuple{2, HorizonSide})
    for side in sides
        move!(r, side)
    end
end

function inverse_side(sides::NTuple{2, HorizonSide})
    new_sides = (inverse_side(sides[1]), inverse_side(sides[2]))
    return new_sides
end
inverse_side(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+2, 4))