-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	Get member Id 
-- =============================================

EXEC dbo.DropFunctionIfExists '[dbo].[fn_GetMemberId]'
GO

CREATE FUNCTION [dbo].[fn_GetMemberId]
(
	@UserName NVARCHAR(100),
	@SiteId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @MemberId INT

	SET @MemberId = 
	(
		SELECT 
			Member.MemberId
		FROM 
			Member WITH (NOLOCK)
		INNER JOIN Community WITH (NOLOCK) ON 
			Member.CommunityId = Community.CommunityId 
		INNER JOIN CommunityGroup WITH (NOLOCK) ON 
			Community.CommunityId = CommunityGroup.CommunityId 
		INNER JOIN [Site] WITH (NOLOCK) ON 
			CommunityGroup.CommunityGroupId = Site.CommunityGroupId
		WHERE 
			(Member.UserName = @UserName)
			AND (Site.SiteId = @SiteId)

			UNION

		SELECT 
			Member.MemberId
		FROM 
			Member WITH (NOLOCK)
		INNER JOIN Community WITH (NOLOCK) ON 
			Member.CommunityId = Community.CommunityId 
		INNER JOIN CommunityGroup WITH (NOLOCK) ON 
			Community.CommunityId = CommunityGroup.CommunityId 
		INNER JOIN [Site] WITH (NOLOCK) ON 
			CommunityGroup.CommunityGroupId = Site.CommunityGroupId
		WHERE 
			(Member.Email = @UserName)  
			AND (Site.SiteId = @SiteId)
	);

	RETURN @MemberId
END






GO
