#7
function pod_prohod!(r::Robot, side::HorizonSide)
    find_kletku!(r, side)
end

function find_kletku!(r::Robot, side::HorizonSide)
    n_steps = 1
    ort_side = HorizonSide((Int(side) + 1) % 4)
    while isborder(r, side)
        moves!(r, ort_side, n_steps)
        n_steps += 1
        ort_side = inverse_side(ort_side)
    end
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

function moves!(r::Robot, side::HorizonSide, n_steps::Int)
    for _ in 1:n_steps
        move!(r, side)
    end
end