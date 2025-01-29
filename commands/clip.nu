export def main []: string -> any {
	match $nu.os-info {
		{ name: macos } => ^pbcopy,
		$os => { error make { msg: $'Unsupported OS: "($os)"' } }
	}
}
