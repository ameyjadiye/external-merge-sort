#!/home/amey/.rvm/rubies/ruby-2.0.0-p353/bin/ruby

require 'find'
require 'set'
cache = {}
Find.find('./inputs/') do |f|
	if File.file?(f)
		File.open(File.absolute_path(f), 'rb') do |f1|  
  			while line = f1.gets
				key = line.split('^').first
				val = line.split('^').last
				if not cache.has_key?(key) then
    					cache[key] = val.split(",").map { |i| i.to_i }.to_set
				else
					cache[key].merge(val.split(",").map { |i| i.to_i }.to_set)
				end
  			end  
		end
	end
end
cache.each { |url, segmnet| puts "#{url}^#{segmnet.to_a.sort.join(',')}" }
