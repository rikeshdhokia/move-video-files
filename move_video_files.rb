VIDEO_FILE_EXT = [".avi", ".m4v", ".mov", ".mp4"]
$count = 0
def move_video_files(path)
  Dir.foreach(path) {|filename|
    
    unless (filename.start_with? '.' || filename == '..')
      fullpath = "#{path}/#{filename}"
      if (Dir.exist? fullpath)
        move_video_files(fullpath)
      else
        if (VIDEO_FILE_EXT.include? (File.extname(filename).downcase))          
          puts fullpath
          $count += 1
        end
      end
    end
  }

end

move_video_files '/Volumes/Bug Home/Photos'
p $count