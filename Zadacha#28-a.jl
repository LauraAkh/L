#28-a
function get_fibbonachi(n::Int)::Int
    if n == 1 || n == 2
        return 1
    end
    a = 1
    b = 1
    for _ in 3:n
        tmp = a + b
        a, b = b, tmp
    end
    return b
end