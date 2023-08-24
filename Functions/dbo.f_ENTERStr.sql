USE [MberplusClubBuild_DEV]
GO
/****** Object:  UserDefinedFunction [dbo].[f_ENTERStr]    Script Date: 8/14/2023 9:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Loai bo phim enter
-- =============================================
CREATE FUNCTION [dbo].[f_ENTERStr_test2]
(
	@str NVARCHAR(500)
)
RETURNS NVARCHAR(500)
AS
BEGIN
	DECLARE @new_str NVARCHAR(500)
	SET @new_str = LTRIM(RTRIM(Replace(Replace(REPLACE(@str, CHAR(9), ''),CHAR(10),''),CHAR(13),'')))
	RETURN @new_str
END
