-- [[
-- @cond ___LICENSE___
--
-- Copyright (c) 2016-2018 Zefiros Software.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
-- @endcond
-- ]]

project "bgfx"
    kind "StaticLib" 

    files {
        "include/**.h",
	    "src/**.cpp",
        "src/**.h"
    }

    removefiles {
        "src/amalgamated*",
        "src/**.bin.h" 
    } 

    zpm.uses "Zefiros-Software/bx"
    zpm.uses "Zefiros-Software/bimg"

    filter "system:windows"
        linkoptions "/ignore:4221"
    
    filter { "system:macosx", "not action:ios" }

        files {
            "src/glcontext_**.mm",
            "src/renderer_**.mm"
        }

    filter {}

    zpm.export(function()

        includedirs {
            "3rdparty/dxsdk/include",
            "3rdparty/khronos",
            "3rdparty",
            "include",
        }       

        filter { "system:windows", "not action:android" }        
            links {
                "gdi32",
                "psapi"
            }

        filter "system:linux"
        
            links {
                "pthread",
                "X11",
                "GL",
                "dl"
            }

            buildoptions {
                "-fPIC"
                }
        
        filter { "system:macosx", "not action:ios" }

            linkoptions {
                "-framework Cocoa",
                "-framework QuartzCore",
                "-framework OpenGL",
                "-weak_framework Metal"
            }   
            
            files {
                "src/glcontext_**.mm",
                "src/renderer_**.mm"
            }

        filter "action:android"

            links {
                "EGL",
                "GLESv2"
            }

        filter "action:ios"

            linkoptions {
                "-framework CoreFoundation",
                "-framework Foundation",
                "-framework OpenGLES",
                "-framework UIKit",
                "-framework QuartzCore",
                "-weak_framework Metal",
            }

        filter {}

    end)