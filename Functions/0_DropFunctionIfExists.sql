IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.DropFunctionIfExists') AND type = 'P')
	DROP PROC dbo.DropFunctionIfExists 
GO

CREATE PROCEDURE dbo.DropFunctionIfExists
    @FuncName nvarchar(100)    
AS
BEGIN

	SET NOCOUNT ON		
	
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(@FuncName) AND type IN ('FN', 'IF', 'TF'))
		EXEC('DROP FUNCTION ' + @FuncName)
	
END
