-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	Get member related data by username
-- =============================================

EXEC dbo.CreateIfNotExists '[dbo].[MemberGetByUsername]'
GO

ALTER PROCEDURE [dbo].[MemberGetByUsername]
	(@UserName NVARCHAR(100),
	@SiteId INT)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @MemberId INT

	SET @MemberId = dbo.fn_GetMemberId(@UserName, @SiteId)

	EXEC dbo.MemberGetById @MemberId, @SiteId;

	EXEC dbo.MemberPointsBalanceGet @MemberId
END


GO
