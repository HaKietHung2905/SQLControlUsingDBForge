USE [MberplusClubBuild_DEV]
GO
/****** Object:  UserDefinedFunction [dbo].[f_ENTERStr_test]    Script Date: 8/25/2023 10:26:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Loai bo phim enter
-- =============================================
CREATE FUNCTION [dbo].[f_ENTERStr_test3]
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
