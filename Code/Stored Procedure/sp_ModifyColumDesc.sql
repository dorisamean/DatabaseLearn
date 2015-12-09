/************************************************
 * Date: 2015/12/19
 * Author: Ina Lai
 * Name: sp_ModifyColumDesc
 * Description: 修改資料行描述
 * Parameters: 
 *		@tableName: 資料表名稱(table name)
 *		@colName: 資料行名稱(column name)
 *		@colDesc: 描述
 * Version: Miscrosoft SQL Server 2012
 ***********************************************/
CREATE PROCEDURE [dbo].[sp_ModifyColumDesc]
 @tableName varchar(50),@colName varchar(50), @colDesc nvarchar(50)
as
IF not exists(SELECT * FROM ::fn_listextendedproperty (NULL, 'SCHEMA', 'dbo', 'table', @tableName, 'COLUMN',@colName))
	BEGIN
		EXEC sp_addextendedproperty 'MS_Description', @colDesc, 'SCHEMA', 'dbo', 'table', @tableName, 'COLUMN',@colName
    END
ELSE
	BEGIN
		exec sp_updateextendedproperty 'MS_Description', @colDesc, 'SCHEMA', 'dbo', 'table', @tableName, 'COLUMN',@colName
    END
GO