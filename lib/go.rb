system("rm *.java")
system("rm *.class")
for file in ['std_lib_stevia', 'profile_stev', 'specs_stev']
  raise file unless system("j -S mirahc #{file}")
end
raise unless system("java SpecsStev")

