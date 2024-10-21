export def --wrapped main [...rest] {
	^nix ...$rest ...[
		--extra-experimental-features flakes,
		--extra-experimental-features nix-command,
	]
}
