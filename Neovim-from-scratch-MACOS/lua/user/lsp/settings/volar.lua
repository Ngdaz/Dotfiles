local util = require("lspconfig.util")

local global_ts = "/home/ngda/.nvm/versions/node/v16.20.2/lib/node_modules/typescript/lib"
if vim.fn.has("macunix") == 1 then
	-- Mac path
	global_ts = "/Users/duyanhnguyen/.nvm/versions/node/v16.20.2/lib/node_modules/typescript/lib"
end

local function get_typescript_server_path(root_dir)
	local found_ts = ""
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(found_ts) then
			return path
		end
	end

	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end


return {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	settings = {
		typescript = {
			preferences = {
				importModuleSpecifier = "non-relative",
			},
		},
	},
	init_options = {
		typescript = {
			tsdk = "/usr/local/lib/node_modules/typescript/lib",
		},
	},
	on_new_config = function(new_config, new_root_dir)
		new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
	end,
}
