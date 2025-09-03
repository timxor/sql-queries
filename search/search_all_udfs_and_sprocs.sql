-- ================================================================
--    file:          search_all_udfs_and_sprocs.sql
--
--    description:   Script to search for user-defined functions (UDFs) 
--                   and stored procedures by name in the database.
--                   Example shown: locating the MyReport UDF
--                   used in an RDL file for reporting.
--                   That UDF takes @Id (schema.table.Id)
--                   as an input parameter.
--
--    usage:         USE [Database];
--                   SELECT *
--                   FROM  ;
--
-- ================================================================

USE Database; -- Switch to the target database

-- Declare the search term once, so it’s easy to change
DECLARE @SearchTerm NVARCHAR(255) = '%search_term%';

-- Search functions and stored procedures by name
SELECT
    ROUTINE_TYPE,     -- Indicates whether it is a FUNCTION or PROCEDURE
    ROUTINE_SCHEMA,   -- Schema (e.g., dbo, sba)
    ROUTINE_NAME      -- Name of the routine
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_NAME LIKE @SearchTerm
ORDER BY ROUTINE_TYPE, ROUTINE_SCHEMA, ROUTINE_NAME;