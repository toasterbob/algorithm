


def knapsack(weights, values, capacity)
  return 0 if capacity == 0 || weights.length == 0

  solution_table = []
  (0..capacity).each do |i|
    solution_table[i] = []
    (0..weights.length - 1).each do |j|
      if i == 0
        solution_table[i][j] = 0
      elsif j == 0
        solution_table[i][j] = weights[0] > i ? 0 : values[0]
      else
        option1 = solution_table[i][j - 1]
        option2 = i < weights[j] ? 0 : solution_table[i - weights[j]][j - 1] + values[j]
        optimum = [option1, option2].max
        solution_table[i][j] = optimum
      end
    end
  end

  solution_table[capacity][weights.length - 1]
end
