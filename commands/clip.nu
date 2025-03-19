export def main []: any -> any {
	to text
		| ansi strip
		| match $nu.os-info {
				{ name: macos } => ^pbcopy,
				$os => { error make { msg: $'Unsupported OS: "($os)"' } }
			}
}
