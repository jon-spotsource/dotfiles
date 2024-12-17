export def main []: string -> any {
	match $nu.os-info {
		{ name: macos } => ^pbcopy,
		_ => { error make { msg: $'Unsupported OS: "($in)"' } }
	}
}
