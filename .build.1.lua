
project "bgfx"

    kind "StaticLib"
 

    files {
       "include/**.h",
	"src/**.cpp",
        "src/**.h"
      }

    removefiles {
         "src/**.bin.h",
	}

    includedirs {
	"3rdparty",
        "3rdparty/khronos",
	"3rdparty/dxsdk/include",
 	"include",
	}

    filter { "system:windows", "not action:android" }
	
	links {
	    "gdi32",
	    "psapi",
	      }

    filter "system:linux"
	
	links {
		"X11",
		"GL",
		"pthread",
	      }

	buildoptions {
		"-fPIC",
		}
	
    filter { "system:macosx", "not action:ios" }

	linkoptions {
			"-framework Cocoa",
			"-framework QuartzCore",
			"-framework OpenGL",
			"-weak_framework Metal",
		    }   
    
	files {
		"src/glcontext_**.mm",
		"src/renderer_**.mm",
	      }

    filter "action:android"

	links {
		"EGL",
		"GLESv2",
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

    zpm.export(function()

	includedirs {
           "3rdparty",
           "3rdparty/khronos",
           "3rdparty/dxsdk/include",
           "include",
        }

	filter { "system:windows", "not action:android" }

            links {
            "gdi32",
            "psapi",
              }

        filter "system:linux"

             links {
                "X11",
                "GL",
                "pthread",
               }

	filter { "system:macosx", "not action:ios" }

        	linkoptions {
                        "-framework Cocoa",
                        "-framework QuartzCore",
                        "-framework OpenGL",
                        "-weak_framework Metal",
                    }

	filter "action:android"

             links {
                "EGL",
                "GLESv2",
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

    zpm.uses {
	"Zefiros-Software/bx"
    }

