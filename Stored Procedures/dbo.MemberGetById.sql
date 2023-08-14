-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	Get member related data by member id
-- =============================================

EXEC dbo.CreateIfNotExists '[dbo].[MemberGetById]'
GO

ALTER PROCEDURE [dbo].[MemberGetById]
	 @MemberId INT
	,@SiteId INT
AS
BEGIN
	SET NOCOUNT ON;	

	-- Get the member profile records
	SELECT 
		 m.[MemberId]
		,m.[Firstname]
		,m.[Surname]
	FROM
		[dbo].[Member] m WITH (NOLOCK)
		INNER JOIN [dbo].[Site] s WITH (NOLOCK) ON s.CommunityGroupId = m.CommunityGroupId
	WHERE
		(m.MemberId = @MemberId) 
		AND ([s].SiteId = @SiteId);
		
	-- Get the member groups
	SELECT 
		 mmg.[MemberMemberGroupId]
		,mmg.[MemberId]
		,mmg.[MemberGroupId]
	FROM
		[dbo].[MemberMemberGroup] mmg WITH (NOLOCK)
		INNER JOIN [dbo].[Member] m WITH (NOLOCK) ON mmg.MemberId = m.MemberId
		INNER JOIN [dbo].[Site] s WITH (NOLOCK) ON s.CommunityGroupId = m.CommunityGroupId
	WHERE
		(m.MemberId = @MemberId) 
		AND	(s.SiteId = @SiteId);

	-- Get member's permissions
	EXEC dbo.MemberPermissionGet @MemberId, @SiteId, 1
	
	-- Get member's addresses
	SELECT 
		 [AddressId]
		,[AddressTypeId]
		,[EntityId]
		,[BusinessName]
		,[RecipientFirstName]
		,[RecipientSurname]
		,[Address1]
		,[Address2]
		,[Suburb]
		,[State]
		,[CountryId]
		,[PostCode]
		,[PhoneBH]
		,[DataUploadId]
		,[IsDefault]
		,[ImpersonatedBy]
		,[CreatedBy]
		,[CreatedDateUtc]
		,[LastModifiedBy]
		,[LastModifiedDateUtc]
	  FROM 
		[dbo].[Address] WITH (NOLOCK)
	  WHERE 
		([AddressTypeId] = 1) AND 
		([EntityId] = @MemberId)

	--Get member's Member Group Point Allocation data

	-- Member's Permission Role Assignment


END


GO
