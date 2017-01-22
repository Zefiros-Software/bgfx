
workspace "bgfx"
   configurations { "Test" }

   startproject "bgfx"

    project "bgfx"
        kind "ConsoleApp"
        files "main.cpp"

        zpm.uses "Zefiros-Software/bgfx"