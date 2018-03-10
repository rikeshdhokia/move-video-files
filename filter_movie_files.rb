require 'set'
def filter
  Dir.foreach("test") {|x| puts "Got #{x}" }
end


def distinct_file_types (path)
  result = []
  
  Dir.foreach(path) {|filename|
    fullpath = "#{path}/#{filename}"
    unless (filename == '.' || filename == '..')
      if (Dir.exist? fullpath)         
        result.push(distinct_file_types fullpath)
      else
        result.push filename.split('.').last.downcase
      end
    end
  }  
  result.flatten
end

p SortedSet.new(distinct_file_types '/Volumes/Bug Home/Photos')