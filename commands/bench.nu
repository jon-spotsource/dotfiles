use std

export def main [
	code: closure # The piece of `nushell` code to measure the performance of

	--pretty # Shows the results in human-readable format: "<mean> +/- <stddev>"

	# The number of benchmark rounds (hopefully the more rounds the less variance)
	--rounds (-n) = 50
	--sd-range: any # Show # sd range of results
	--verbose (-v) # Be more verbose (namely prints the progress)
]: string -> any {
	{
		code: $code,
		pretty: $pretty,
		rounds: $rounds,
		sd-range: $sd_range,
		verbose: $verbose,
	}
		| inspect
		| print

	if ($sd_range | is-empty) {
		return (std bench --pretty=$pretty --rounds $rounds --verbose=$verbose $code)
	}

	let report = std bench --rounds=$rounds --verbose=$verbose $code

	if $pretty {
		print $'($report.mean) +/- ($report.std)'
	}

	let $sd_range = match ($sd_range | describe) {
		'bool' => { if $sd_range { 1 } },
		'int' => { $sd_range },

		$value_type => {
			error make {
				label: {
					span: (metadata $sd_range).span,
					text: $'Type `($value_type)` cannot be used'
				},
				msg: 'Unexpected value',
			}
		},
	}

	if ($sd_range | is-empty) {
		return
	}

	{
		min: ($report.mean - $report.std),
		max: ($report.mean + $report.std),
	}
		| to text
		| print
}
