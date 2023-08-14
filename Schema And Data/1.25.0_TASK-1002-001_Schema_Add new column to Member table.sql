-- =============================================
-- Author:		Wenfei Lian
-- Create date: 07/08/2023
-- Description:	Add new column to member table
-- =============================================

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Member')
BEGIN

	-- For dev and staples
	IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME = 'Member' AND COLUMN_NAME = 'MemberStatusId')
    BEGIN
		ALTER TABLE Member ADD MemberStatusId INT NOT NULL 
        DEFAULT 1
    END

END