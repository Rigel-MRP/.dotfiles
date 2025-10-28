{ ... }:

{
	programs.nixvim ={
		plugins.harpoon = {
			enable = true;
		};

		keymaps = [
			{
				mode = "n";
				key = "<leader>a";
				action.__raw = "function() require('harpoon'):list():add() end";
				options.desc = "Harpoon: Add file";
			}
			{
				mode = "n";
				key = "<leader>h";
				action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
				options.desc = "Harpoon: Toggle menu";
			}
			{
				mode = "n";
				key = "<leader>1";
				action.__raw = "function() require('harpoon'):list():select(1) end";
				options.desc = "Harpoon: Go to file 1";
			}
			{
				mode = "n";
				key = "<leader>2";
				action.__raw = "function() require('harpoon'):list():select(2) end";
				options.desc = "Harpoon: Go to file 2";
			}
			{
				mode = "n";
				key = "<leader>3";
				action.__raw = "function() require('harpoon'):list():select(3) end";
				options.desc = "Harpoon: Go to file 3";
			}
			{
				mode = "n";
				key = "<leader>4";
				action.__raw = "function() require('harpoon'):list():select(4) end";
				options.desc = "Harpoon: Go to file 4";
			}
			{
				mode = "n";
				key = "<leader>5";
				action.__raw = "function() require('harpoon'):list():select(5) end";
				options.desc = "Harpoon: Go to file 5";
			}
		];
	};	
}
