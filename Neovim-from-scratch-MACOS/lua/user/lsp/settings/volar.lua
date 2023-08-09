local util = require("lspconfig.util")

local global_ts = "/home/duyanhnguyen/.nvm/versions/node/v16.20.0/lib/node_modules/typescript/lib"
if vim.fn.has("macunix") == 1 then
	-- Mac path
	global_ts = "/Users/duyanhnguyen/.nvm/versions/node/v16.20.0/lib/node_modules/typescript/lib"
end

local function get_typescript_server_path(root_dir)
	-- Alternative location if installed as root:
	-- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
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
	capabilities = vim.capabilities,
	filetypes = vim.is_npm_package_installed("vue")
			and { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
		or { "vue" },
	root_dir = require("lspconfig").util.root_pattern("package.json"),
	documentFeatures = {
		documentFormatting = {
			defaultPrintWidth = 60,
		},
	},
	settings = {
		typescript = {
			preferences = {
				-- "relative" | "non-relative" | "auto" | "shortest"(not sure)
				importModuleSpecifier = "non-relative",
			},
		},
	},
	init_options = {
		languageFeatures = {
			implementation = true, -- new in @volar/vue-language-server v0.33
			documentHighlight = true,
			documentLink = true,
			codeLens = { showReferencesNotification = true },
			semanticTokens = false,
			diagnostics = true,
			schemaRequestService = true,
		},
	},

	on_new_config = function(new_config, new_root_dir)
		new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
	end,
}
