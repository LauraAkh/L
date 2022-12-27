#28-b
function fibbonachi_b(n::Int)::Int
    if n == 1 || n == 2
        return 1
    end
    return fibbonachi_b(n-1) + fibbonachi_b(n - 2)
end