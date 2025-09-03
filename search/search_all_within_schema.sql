SELECT table_schema, table_name, column_name
FROM information_schema.columns
WHERE table_schema = 'YourSchemaName'
AND column_name LIKE '%search_term%';