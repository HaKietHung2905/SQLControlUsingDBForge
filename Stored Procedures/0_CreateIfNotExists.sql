IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.CreateIfNotExists') AND type = 'P')
	DROP PROC dbo.CreateIfNotExists 
GO
 
CREATE PROCEDURE dbo.CreateIfNotExists 
    @ProcName nvarchar(500)    
AS
BEGIN

	SET NOCOUNT ON		
	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(@ProcName) AND type = 'P')
		EXEC('CREATE PROCEDURE ' + @ProcName + ' AS BEGIN SET NOCOUNT ON; END')
	
END
