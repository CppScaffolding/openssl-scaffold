-- scaffold geniefile for openssl

openssl_script = path.getabsolute(path.getdirectory(_SCRIPT))
openssl_root = path.join(openssl_script, "openssl")

openssl_includedirs = {
	path.join(openssl_script, "config"),
	openssl_root,
}

openssl_libdirs = {}
openssl_links = {}
openssl_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { openssl_includedirs }
	end,

	_add_defines = function()
		defines { openssl_defines }
	end,

	_add_libdirs = function()
		libdirs { openssl_libdirs }
	end,

	_add_external_links = function()
		links { openssl_links }
	end,

	_add_self_links = function()
		links { "openssl" }
	end,

	_create_projects = function()

project "openssl"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		openssl_includedirs,
	}

	defines {}

	files {
		path.join(openssl_script, "config", "**.h"),
		path.join(openssl_root, "**.h"),
		path.join(openssl_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
