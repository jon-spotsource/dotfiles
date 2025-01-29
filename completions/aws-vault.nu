def 'nu-complete aws-vault export formats' [] {
	[
		env,
		export-env,
		ini,
		json,
	]
}

def 'nu-complete aws-vault profiles' [] {
	^aws-vault list --profiles
		| lines
		| where ($it != 'default')
		| uniq
		| sort
}

export extern 'aws-vault export' [
	--backend: string # Secret backend to use [keychain pass file] ($AWS_VAULT_BACKEND)

	--debug # Show debugging output
	--duration (-d): string # Duration of the temporary or assume-role session. Defaults to 1h

	--file-dir: string # Directory for the "file" password store ($AWS_VAULT_FILE_DIR)

	--format: string@'nu-complete aws-vault export formats' # Format to output credentials. Valid formats: env, export-env, json, ini

	--keychain: string # Name of macOS keychain to use, if it doesn't exist it will be created ($AWS_VAULT_KEYCHAIN_NAME)

	--mfa-token (-t): string # The MFA token to use
	--no-debug # No debugging output
	--no-help # No context-sensitive help (also try --help-long and --help-man).
	--no-no-session # Include creating STS session with GetSessionToken
	--no-session (-n) # Skip creating STS session with GetSessionToken
	--no-stdout # Don't print the SSO link to the terminal without automatically opening the browser

	--no-version # Don't show application version.
	--pass-cmd: string # Name of the pass executable ($AWS_VAULT_PASS_CMD)
	--pass-dir: path # Pass password store directory ($AWS_VAULT_PASS_PASSWORD_STORE_DIR)

	--pass-prefix: string # Prefix to prepend to the item path stored in pass ($AWS_VAULT_PASS_PREFIX)

	--prompt: string # Prompt driver to use [osascript terminal] ($AWS_VAULT_PROMPT)

	--region: string # The AWS region
	--secret-service-collection: string # Name of secret-service collection to use, if it doesn't exist it will be created ($AWS_VAULT_SECRET_SERVICE_COLLECTION_NAME)

	--stdout # Print the SSO link to the terminal without automatically opening the browser

	--version # Show application version.

	profile: string@'nu-complete aws-vault profiles'
]
