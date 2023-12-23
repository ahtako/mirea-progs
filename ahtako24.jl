function find_largest_rectangle(grid)
    m = size(grid, 1)
    n = size(grid, 2)
    dp = zeros(Int, m, n)
    max_area = 0
    
    for i in 1:m
        for j in 1:n
            if grid[i, j] == 1
                if i > 1 && j > 1
                    dp[i, j] = min(dp[i-1, j], dp[i, j-1], dp[i-1, j-1]) + 1
                else
                    dp[i, j] = 1
                end
                max_area = max(max_area, dp[i, j])
            end
        end
    end
    
    return max_area * max_area
end

# Пример использования:
grid = [
    1 0 0 0 0
    1 1 1 1 0
    1 1 1 1 0
    1 0 0 0 0
]

largest_rectangle_area = find_largest_rectangle(grid)
println("Площадь наибольшей прямоугольной перегородки: ", largest_rectangle_area)
