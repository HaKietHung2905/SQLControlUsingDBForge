-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	Add status to MemberStatus
-- =============================================

IF NOT EXISTS (SELECT 1 FROM [dbo].[MemberStatus] where Name = 'Enabled')
BEGIN
	INSERT INTO dbo.MemberStatus (Name) VALUES ('Enabled');
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[MemberStatus] where Name = 'Disabled')
BEGIN
	INSERT INTO dbo.MemberStatus (Name) VALUES ('Disabled');
END
