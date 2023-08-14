EXEC dbo.CreateIfNotExists '[dbo].[CreateTriggerOnTableIfNotExists]'
GO

ALTER PROCEDURE dbo.CreateTriggerOnTableIfNotExists 
	@TriggerSchemaName sysname = N'dbo',
    @TriggerName sysname,
	@TableSchemaName sysname = N'dbo',
	@TableName sysname
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @TriggerFullName nvarchar(MAX);
	SET @TriggerFullName = QUOTENAME(@TriggerSchemaName) + N'.' + QUOTENAME(@TriggerName);
	
	DECLARE @TableFullName nvarchar(MAX);
	SET @TableFullName = QUOTENAME(@TableSchemaName) + N'.' + QUOTENAME(@TableName);
	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(@TriggerFullName) AND type = 'TR')
		EXEC(N'CREATE TRIGGER ' + @TriggerName + N' ON ' + @TableFullName + N' FOR UPDATE AS BEGIN SET NOCOUNT ON; END')
	
END
