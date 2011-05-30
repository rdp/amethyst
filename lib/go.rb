system("rm *.java")
should_recompile = false
for file in ['std_lib_stevia', 'std_lib_ruby_int', 'profile_stev']
  camelcase = file.split('_').map{|name| name.capitalize}.join('')
  old_class = camelcase + '.class'
  if File.exist?(old_class) && !should_recompile
    old_build = File.mtime(old_class)
    current_time = File.mtime(file)
    if current_time < old_build
      next
    end
  end
  p 'compiling ' + file
  c = "j -S mirahc #{file}"
  raise c unless system(c)
  should_recompile = true
  
end

# sigh ...

for command in ['mirahc -j specs_stevia', 'javac SpecsStevia.java', 'java SpecsStevia']
  print  'running ', command
  raise command unless system command
end

