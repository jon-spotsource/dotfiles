export def --wrapped main [...rest] {
	^nix ...$rest --extra-experimental-features nix-command
}
