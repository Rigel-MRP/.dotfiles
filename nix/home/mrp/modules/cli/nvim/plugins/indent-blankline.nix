{ config, lib, pkgs, ... }:

{
	programs.nixvim.plugins.indent-blankline = {
		enable = true;
		settings = {
			indent.char = "▏";
			scope = {
				enabled = true;
				show_start = false;
				show_end = false;
				show_exact_scope = true;
			};
		};
	};	
}
