USE [D:\.NET\WATCH\WATCH\APP_DATA\MYDATABASE.MDF]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[procBindAllProducts]

SELECT	@return_value as 'Return Value'

GO
