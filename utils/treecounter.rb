#!/usr/bin/ruby

# Get the directory path from the argument, default to current directory '.'
path = ARGV[0] || '.'

unless Dir.exist?(path)
  puts "Error: Directory '#{path}' does not exist."
  exit
end

total_lines = 0
file_count = 0

# Dir.glob with '**/*' finds every file and folder recursively
# File.join ensures the path formatting is correct for your OS
search_pattern = File.join(path, '**', '*')

Dir.glob(search_pattern).each do |entry|
  # Skip if the entry is a directory; we only want to count lines in files
  next if File.directory?(entry)

  begin
    line_count = 0
    File.foreach(entry) { line_count += 1 }
    
    puts "#{entry}: #{line_count} lines"
    total_lines += line_count
    file_count += 1
  rescue => e
    puts "Could not read #{entry}: #{e.message}"
  end
end

puts "---"
puts "Total Files: #{file_count}"
puts "Total Lines: #{total_lines}"
