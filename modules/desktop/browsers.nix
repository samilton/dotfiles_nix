# brower setup
{ pkgs, lib, config, ... }: {
	options = {
		browsers.firefox.enable = lib.mkEnableOption "enables firefox";
	};

	config = {
	};

}
