rm *.java
rm *.class
call compile && call java SpecsStev && call timer run_stevia_server.bat
