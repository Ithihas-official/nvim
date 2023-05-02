local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local config = {
	cmd = {
		-- JAVA_BIN ROOT
		"/home/ithihas/my_apps/jdk-17.0.6/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-noverify",
		"-Xmx1G",
		"-jar",
		-- JDTLS_EQUINOX ROOT
		"/home/ithihas/my_apps/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		-- JDTLS_CONFIG_SYSTEM ROOT
		"/home/ithihas/my_apps/jdt-language-server-1.9.0-202203031534/config_linux/",
		"-data",
		vim.fn.expand("~/.cache/jdtls/workspace") .. workspace_dir,
	},
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	capabilities = capabilities,
}
require("jdtls").start_or_attach(config)
