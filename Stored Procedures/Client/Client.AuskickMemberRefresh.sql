-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	Member Reresh for Auskick
-- =============================================

EXEC dbo.CreateIfNotExists '[Client].[AuskickMemberRefresh]'
GO

ALTER PROCEDURE Client.AuskickMemberRefresh
    @CompanyId INT,
    -- other variables
AS
BEGIN
    -- Variable declarision
    DECLARE @SomeId INT, @SomeOtherId INT;
    DECLARE @NowUtc DATETIME;


    -- Content

    COMMIT

END