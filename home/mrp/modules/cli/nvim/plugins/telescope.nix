{ ... }:

{
	programs.nixvim = {
		plugins = {
			web-devicons.enable = true;
			telescope = {
					enable = true;
			};
		};	
		
		keymaps = [
			{
				mode = "n";
				key = "<leader>ff";
				action.__raw = "require('telescope.builtin').find_files";
				options.desc = "find files";
			}
			{
				mode = "n";
				key = "<leader>fg";
				action.__raw = "require('telescope.builtin').live_grep";
				options.desc = "live grep";
			}
			{
				mode = "n";
				key = "<leader>fb";
				action.__raw = "require('telescope.builtin').buffers";
				options.desc = "buffers";
			}
			{
				mode = "n";
				key = "<leader>fh";
				action.__raw = "require('telescope.builtin').help_tags";
				options.desc = "help tags";
			}
			{
				mode = "n";
				key = "<leader>fo";
				action.__raw = "require('telescope.builtin').oldfiles";
				options.desc = "recent files";
			}
		];
	};	
}
