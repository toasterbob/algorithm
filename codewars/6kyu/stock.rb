def balanceStatements(str)
    arr = str.split(",")
    buy, sell = 0, 0
    bad = []
    arr.each do |order|
      order = order.split(" ")
      if order[1].include?(".") || !order[2].include?(".") || order[3].nil?
        bad << order.join(" ") + " ;"
      elsif order[3] == "B"
        buy += (order[1].to_f * order[2].to_f).round
      else
        sell += (order[1].to_f * order[2].to_f).round
      end
    end
    if bad.empty?
      bad = nil
    else
      bad = "; Badly formed #{bad.length}: " + bad.join("")
    end
    "Buy: #{buy} Sell: #{sell}#{bad}"
end
