-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	Add new table MemberStatus
-- =============================================

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MemberStatus' and TABLE_SCHEMA = 'dbo')
BEGIN

	CREATE TABLE [dbo].[MemberStatus](
		[MemberStatusId] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](250) NOT NULL,

	 CONSTRAINT [PK_MemberStatus] PRIMARY KEY CLUSTERED 
	(
		[MemberStatusId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END