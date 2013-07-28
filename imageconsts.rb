#!/usr/bin/env ruby

root = ARGV[0]

$stdout.reopen("#{root}/Pods/MBImageConstants/MBImageConstants.h",'w')

puts "// MBImageConstants"
puts "// Dont change it!  1"

class Image
    attr_accessor :normal, :retina
end

hash = {}

Dir.glob("#{root}/**/*.png") do |file|
    basename = File.basename(file, ".png")
    basenameWithoutAtTwo = basename.chomp("@2x")
    
    key = basenameWithoutAtTwo
    
    if hash[key].nil? then
        hash[key] = Image.new
    end
    
    if basename.include? "@2x" then
        hash[key].retina = :true
    else
        hash[key].normal = :true
    end
    
end

hash.each_key do |key|
    define = key.gsub('-', '_')
    
    normal = ""
    retina = ""
    
    normal = "Normal " if hash[key].normal
    retina = "Retina " if hash[key].retina
    
    puts "// #{key}: #{normal} #{retina}"
    
    puts "#define image#{define} @\"#{key}\""
end

#puts "const NSString* img#{basename.gsub('-','_')} = @\"#{basename}\";"

puts "// end"

$stdout=STDOUT
