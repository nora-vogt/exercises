# Passing Parameters 1

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

items = ['apples', 'corn', 'cabbage', 'wheat']
gather(items) { |produce| puts "#{produce.join(', ')}" }

gather(items) do |produce|
  produce.each do |item|
    puts "Gathering some #{item}!"
  end
end