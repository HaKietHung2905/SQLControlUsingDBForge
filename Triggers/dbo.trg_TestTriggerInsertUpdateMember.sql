-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	test trigger for update / insert member
-- =============================================

EXEC dbo.CreateTriggerOnTableIfNotExists @TriggerName = N'trg_TestTriggerInsertUpdateMember', @TableName = N'Member'
GO

ALTER TRIGGER [dbo].[trg_TestTriggerInsertUpdateMember] ON [dbo].[Member]
FOR INSERT,UPDATE
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @LastModifiedBy INT
	DECLARE @LastModifiedDateUtc DATETIME

END
GO
