#16
function pod_prohod!(r::Robot, side_to_wall::HorizonSide)
    n_steps = 1
    side = next_side(side_to_wall)

    while isborder(r, side_to_wall)
        for _ in 1:n_steps
            shatl!( _ -> !isborder(r, side_to_wall), r, side)
        end
        side = inverse_side(side)
        n_steps += 1
    end
end
function shatl!(stop_condition::Function, robot::Robot, side::HorizonSide)
    if !stop_condition(side)
        move!(robot, side)
    end
end
function next_side(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 1) % 4)
end
function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end