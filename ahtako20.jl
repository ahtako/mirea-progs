function count_horizontal_partitions(field_height::Int, partitions::Array{Tuple{Int, Int}})
    count = 0
    for partition in partitions
        px, py = partition
        if py == py+1
            count += 1
        end
    end
    return count
end





partitions = [(1, 1), (3, 2), (0, 3), (4, 3)]
field_height = 4

count = count_horizontal_partitions(field_height, partitions)
println("Количество горизонтальных перегородок: ", count)
