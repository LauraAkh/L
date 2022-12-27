#25-b
function line_chess_opposite!(r, side)
    line_chess_mark!(r, side, false)
end

function line_chess_mark!(r::Robot, side::HorizonSide, to_mark = true)
    if to_mark
        putmarker!(r)
    end

    if !isborder(r, side)
        move!(r, side)
        to_mark = !to_mark
        line_chess_mark!(r, side, to_mark)
    end
end

function move!(r::Robot, sides::NTuple{2, HorizonSide})
    for side in sides
        move!(r, side)
    end
end