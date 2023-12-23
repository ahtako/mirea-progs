function count_straight_partitions(partitions::Array{Tuple{Int, Int}})
    count_vertical = 0
    count_horizontal = 0
    for i in 1:length(partitions)
        for j in (i+1):length(partitions)
            x1, y1 = partitions[i]
            x2, y2 = partitions[j]
            if x1 == x2 && y1 != y2
                count_vertical += 1
            elseif x1 != x2 && y1 == y2
                count_horizontal += 1
            end
        end
    end
    return count_vertical, count_horizontal
end





partitions = [(1, 1), (3, 2), (0, 3), (4, 3)]

count_vertical, count_horizontal = count_straight_partitions(partitions)

println("Количество вертикальных перегородок: ", count_vertical)
println("Количество горизонтальных перегородок: ", count_horizontal)
