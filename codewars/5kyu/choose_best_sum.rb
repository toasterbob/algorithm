def choose_best_sum(t, k, ls)
  combos = ls.combination(k)
  best_t = 0
  combos.each do |combo|
    if combo.reduce(:+) > best_t && combo.reduce(:+) <= t
      best_t = combo.reduce(:+)
    end
  end
  best_t == 0 ? nil : best_t
end
