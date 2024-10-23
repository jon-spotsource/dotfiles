export extern 'npm exec knex migrate:list' [
  --client: string # Set DB client.
  --connection: string # Set DB connection.
  --cwd: path # Specify the working directory.
  --debug # Run with debugging.
  --env: string # environment, default: process.env.NODE_ENV || development
  --esm # Enable ESM interop.
  --help (-h) # display help for command
  --knexfile: path # Specify the knexfile path.
  --knexpath: path # Specify the path to knex instance.
  --migrations-directory: path # Set migrations directory.
  --migrations-table-name: path # Set migrations table name.
  --specific: path # Specify one seed file to execute.
  --timestamp-filename-prefix # Enable a timestamp prefix on name of generated seed files.
  --version (-V) # output the version number
]
