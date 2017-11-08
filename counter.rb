(0..2).map do |_|
  Thread.new do
    (0...100).each { |i| sleep 1; puts i }
  end
end.each(&:join)
