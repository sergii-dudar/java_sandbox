package = "deps-management"
version = "dev-1"
source = {
	url = "git+https://github.com/sergii-dudar/java_sandbox.git",
}
description = {
	homepage = "https://github.com/sergii-dudar/java_sandbox",
	license = "*** please specify a license ***",
}
dependencies = {
	"luasocket",
	"lua-cjson",
}
build = {
	type = "builtin",
	modules = {
		index = "index.lua",
	},
}
