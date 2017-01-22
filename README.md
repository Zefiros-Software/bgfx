# bgfx
To use [bgfx](https://github.com/bkaradzic/bgfx) in [ZPM](http://zpm.zefiros.eu), just use:

# [ZPM](http://zpm.zefiros.eu) Installation
In `.package.json`
```json
"requires": [
		{
			"name": "Zefiros-Software/bgfx",
			"version": "@head"
		}
]
```

In `premake5.lua`
```lua
zpm.uses "Zefiros-Software/bgfx"
```

# Status
Type        | Status
----------- | -------
Linux & OSX | [![Build Status](https://travis-ci.org/Zefiros-Software/bgfx.svg?branch=master)](https://travis-ci.org/Zefiros-Software/bgfx)
Windows     | [![Build status](https://ci.appveyor.com/api/projects/status/1ydk546tjkspa3cp?svg=true)](https://ci.appveyor.com/project/Zefiros-Software/bgfx)