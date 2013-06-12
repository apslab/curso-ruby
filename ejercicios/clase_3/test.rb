puts "Script name: #{$0}"
puts "Script arguments: #{$*}"

if $0 == __FILE__
  puts "Run himself"
end

