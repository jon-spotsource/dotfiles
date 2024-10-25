# List locally cloned repositories. If a query argument is given, only
# repositories whose names contain that query text are listed. '-e' ('--exact')
# forces the match to be an exact one (i.e. the query equals to project or
# user/project) If '-p' ('--full-path') is given, the full paths to the
# repository root are printed instead of relative ones.
export extern 'ghq list' [
	--bare = false # Query bare repositories
	--exact (-e) = false # Perform an exact match
	--full-path (-p) = false # Print full paths
	--help (-h) # Show help
	--unique = false # Print unique subpaths
	--vcs: string # Specify vcs backend for matching

	query?: string
]
