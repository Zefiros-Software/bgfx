
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
                "GL"
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