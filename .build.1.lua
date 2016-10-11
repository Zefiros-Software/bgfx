project "bgfx"

    kind "StaticLib"
 

    includedirs {
       "include",
       "src"
    }

    -- generic
    files {
       "include/SFML/System/*.inl",
       "src/SFML/System/*.cpp"
    }

    filter "system:windows"


    filter "system:linux"


    filter "system:macosx"

    
    filter "action:android"


    filter {} 

    zpm.export(function()

        filter "system:macosx"

        filter {}

        includedirs 
	{
        }
     
 
    end)
