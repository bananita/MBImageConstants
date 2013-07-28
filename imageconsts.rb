#
#  imageconsts.rb
#  MBImageConstants
#
#  Created by Michal Banasiak on 27.07.2013.
#  Copyright (c) 2013 Michal Banasiak. All rights reserved.
#  https://github.com/bananita
#

#!/usr/bin/env ruby

root = ARGV[0]

class Image
    attr_accessor :normal, :retina
end

hash = {}

Dir.glob("#{root}/**/*.png") do |file|
    basename = File.basename(file, ".png")
    basenameWithoutAtTwo = basename.chomp("@2x")
    
    key = basenameWithoutAtTwo
    
    hash[key] = Image.new if hash[key].nil?

    if basename.include? "@2x" then
        hash[key].retina = :true
    else
        hash[key].normal = :true
    end
    
end

$stdout.reopen("#{root}/Pods/MBImageConstants/MBImageConstants.h",'w')

puts "//"
puts "//  MBImageConstants.h"
puts "//  MBImageConstants"
puts "//"
puts "//  Created by Michal Banasiak on 27.07.2013."
puts "//  Copyright (c) 2013 Michal Banasiak. All rights reserved."
puts "//  https://github.com/bananita"
puts "//"
puts
puts "// AUTO-GENERATED FILE.  DO NOT MODIFY."
puts
puts "/*"
puts " * This file was automatically generated by the"
puts " * MBImageConstants tool from the images it found."
puts " * It should not be modified by hand."
puts " */"
puts

hash.each_key do |key|
    define = key.gsub('-', '_')
        
    normal = "Normal" if hash[key].normal
    retina = "Retina" if hash[key].retina
    
    if (normal.nil?)
        STDERR.puts "warning: MBImageConstants: missing normal graphics for image #{key}"
    end
    
    if (retina.nil?)
        STDERR.puts "warning: MBImageConstants: missing retina graphics for image #{key}"
    end
    
    puts "// #{key}: #{normal} #{retina}"
    puts "#define image_#{define} @\"#{key}.png\""
    puts
end

puts
puts "// AUTO-GENERATED FILE.  DO NOT MODIFY."

$stdout=STDOUT
