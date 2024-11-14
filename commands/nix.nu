export def --wrapped main [...rest] {
	^nix --extra-experimental-features 'flakes nix-command' ...$rest
}
