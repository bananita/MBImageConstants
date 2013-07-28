#!/usr/bin/env ruby

root = ARGV[0]

Dir.glob("#{root}/**/*.png") do |file|
    puts File.basename(file, ".png")
end
