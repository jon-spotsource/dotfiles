use ../commands [git-root]
use node.nu ['nu-complete node installed binaries', 'nu-complete node scripts']

def 'nu-complete rush projects' [] {
	let $rush_config_path: path = git-root | path join rush.json

	if not ($rush_config_path | path exists) {
		return
	}

	open $rush_config_path
		| get projects
		| sort-by packageName
		| rename value description
		| update description { $'Directory: ($in)' }
}

# This command is similar to "rush rebuild", except that "rush build" performs an incremental build. In other words, it only builds projects whose source files have changed since the last successful build. The analysis requires a Git working tree, and only considers source files that are tracked by Git and whose path is under the project folder. (For more details about this algorithm, see the documentation for the "package-deps-hash" NPM package.) The incremental build state is tracked in a per-project folder called ".rush/temp" which should NOT be added to Git. The build command is tracked by the "arguments" field in the "package-deps_build.json" file contained therein; a full rebuild is forced whenever the command has changed (e.g. "--production" or not).
export extern 'rush build' [
	--to (-t): string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--to" parameter expands this selection to include PROJECT and all its dependencies. "." can be used as shorthand for the project in the current working directory. For details, refer to the website article "Selecting subsets of projects".

	--to-except: string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--to-except" parameter expands this selection to include all dependencies of PROJECT, but not PROJECT itself. "." can be used as shorthand for the project in the current working directory. For details, refer to the website article "Selecting subsets of projects".

  --verbose (-v) # Display the logs during the build, rather than just displaying the build status summary
]

export extern 'rush deploy' [
	--project (-p): string@'nu-complete rush projects'
]

# List package names, and optionally version (--version) and path (--path) or full path (--full-path), for projects in the current rush config.
export extern 'rush list' [
	--detailed # For the non --json view, if this flag is specified, include path (-p), version (-v) columns along with the project's applicable: versionPolicy, versionPolicyName, shouldPublish, reviewPolicy, and tags fields.

	--from (-f): string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--from" parameter expands this selection to include PROJECT and all projects that depend on it, plus all dependencies of this set. "." can be used as shorthand for the project in the current working directory. For details, refer to the website article "Selecting subsets of projects".

	--from-version-policy # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. The "--from-version-policy" parameter is equivalent to specifying "--from" for each of the projects belonging to VERSION_POLICY_NAME. For details, refer to the website article "Selecting subsets of projects".

	--full-path # If this flag is specified, the project full path will be displayed in a column along with the package name.

	--help (-h) # Show this help message and exit.
	--impacted-by (-i): string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--impacted-by" parameter expands this selection to include PROJECT and any projects that depend on PROJECT (and thus might be broken by changes to PROJECT). "." can be used as shorthand for the project in the current working directory. Note that this parameter is "unsafe" as it may produce a selection that excludes some dependencies. For details, refer to the website article "Selecting subsets of projects".

	--impacted-by-except (-I): string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--impacted-by-except" parameter works the same as "--impacted-by" except that PROJECT itself is not added to the selection. "." can be used as shorthand for the project in the current working directory. Note that this parameter is "unsafe" as it may produce a selection that excludes some dependencies. For details, refer to the website article "Selecting subsets of projects".

	--json # If this flag is specified, output will be in JSON format.
	--only (-o): string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--only" parameter expands this selection to include PROJECT; its dependencies are not added. "." can be used as shorthand for the project in the current working directory. Note that this parameter is "unsafe" as it may produce a selection that excludes some dependencies. For details, refer to the website article "Selecting subsets of projects".

	--path (-p) # If this flag is specified, the project path will be displayed in a column along with the package name.

	--to (-t): string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--to" parameter expands this selection to include PROJECT and all its dependencies. "." can be used as shorthand for the project in the current working directory. For details, refer to the website article "Selecting subsets of projects".

	--to-except (-T): string@'nu-complete rush projects' # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. Each "--to-except" parameter expands this selection to include all dependencies of PROJECT, but not PROJECT itself. "." can be used as shorthand for the project in the current working directory. For details, refer to the website article "Selecting subsets of projects".

	--to-version-policy # Normally all projects in the monorepo will be processed; adding this parameter will instead select a subset of projects. The "--to-version-policy" parameter is equivalent to specifying "--to" for each of the projects belonging to VERSION_POLICY_NAME. For details, refer to the website article "Selecting subsets of projects".

	--version (-v) # If this flag is specified, the project version will be displayed in a column along with the package name.
]

export extern rushx [
	script: string@'nu-complete node scripts'
]

export extern 'rush-pnpm exec' [
	binary: string@'nu-complete node installed binaries'
]
