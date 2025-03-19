@example 'Copy a number' { 1234 | clip }
@example 'Copy a string' { 'asdf' | clip }
export def main []: any -> any {
	to text
		| ansi strip
		| match $nu.os-info {
				{ name: macos } => ^pbcopy,
				$os => (error make { msg: $'Unsupported OS: ($os)' })
			}
}
