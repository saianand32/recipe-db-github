USE [XDPortal]
GO
/****** Object:  User [dexter]    Script Date: 03/23/2012 10:10:02 ******/
CREATE USER [dexter] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[userCookBook]    Script Date: 03/23/2012 10:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userCookBook](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NOT NULL,
	[RecipeID] [int] NOT NULL,
	[RecipeName] [varchar](100) NOT NULL,
	[Hits] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_userCookBook] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [UID] ON [dbo].[userCookBook] 
(
	[UID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUserRecipeInCookBook]    Script Date: 03/23/2012 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteUserRecipeInCookBook]

@UserID int,
@ID int

AS
BEGIN

 IF Exists (SELECT * FROM dbo.userCookBook WITH (NOLOCK) WHERE [UID] = @UserID AND ID = @ID)
    BEGIN
      
    END

END
GO
    -- Decrement Total comments count in recipe tabale
    UPDATE dbo.Recipes SET TOTAL_COMMENTS = TOTAL_COMMENTS - 1 WHERE ID IN (SELECT * from dbo.fnConvertCSVToINT(@CsvItemID))

END
GO