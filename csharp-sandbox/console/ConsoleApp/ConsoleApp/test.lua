-- Start from current file's directory
local current_file = vim.fn.expand("%:p")
local current_dir = vim.fn.fnamemodify(current_file, ":h")

-- Search upwards for .csproj file
local function find_csproj(dir)
	local csproj = vim.fn.glob(dir .. "/*.csproj")
	if csproj ~= "" then
		return csproj, dir
	end

	local parent = vim.fn.fnamemodify(dir, ":h")
	-- Stop if we've reached root or can't go higher
	if parent == dir or parent == "" then
		return nil, nil
	end

	return find_csproj(parent)
end

local csproj, project_dir = find_csproj(current_dir)

if csproj ~= "" and csproj ~= nil then
	local project_name = vim.fn.fnamemodify(csproj, ":t:r")
	print(csproj)

	-- Try to detect target framework from bin directory
	local bin_debug = project_dir .. "/bin/Debug"
	local net_dirs = vim.fn.glob(bin_debug .. "/net*", false, true)

	if #net_dirs > 0 then
		-- Use the first (or most recent) framework found
		local framework = vim.fn.fnamemodify(net_dirs[1], ":t")
		print(string.format("%s/bin/Debug/%s/%s.dll", project_dir, framework, project_name))
	end
end

-- Fallback to manual input
-- local fallback_dir = project_dir or vim.fn.getcwd()
-- return vim.fn.input("Path to dll: ", fallback_dir .. "/bin/Debug/", "file")
