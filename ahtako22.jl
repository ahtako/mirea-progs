function count_rectangular_partitions(partitions::Array{Tuple{Int, Int}})
    count = 0
    for i in 1:length(partitions)
        for j in (i+1):length(partitions)
            x1, y1 = partitions[i]
            x2, y2 = partitions[j]
            if x1 == x2 && y1 != y2
                count += 1
            elseif x1 != x2 && y1 == y2
                count += 1
            end
        end
    end
    return count
end






partitions = [(1, 1), (3, 2), (0, 3), (4, 3)]

count_rectangular = count_rectangular_partitions(partitions)

println("Количество прямоугольных перегородок: ", count_rectangular)
