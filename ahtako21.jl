function isborder(side)
    if side == :top || side == :bottom
        return true
    else
        return false
    end
end

function count_vertical_partitions(field_width::Int, partitions::Array{Tuple{Int, Int}})
    count = 0
    for partition in partitions
        px, py = partition
        if px == px+1
            count += 1
        end
    end
    return count
end





partitions = [(1, 1), (3, 2), (0, 3), (4, 3)]
field_width = 4

count_vertical = count_vertical_partitions(field_width, partitions)
count_horizontal = count_horizontal_partitions(field_height, partitions)

println("Количество вертикальных перегородок: ", count_vertical)
println("Количество горизонтальных перегородок: ", count_horizontal)
