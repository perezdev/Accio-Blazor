/****** Object:  Table [dbo].[CardDetail]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDetail](
	[CardDetailId] [uniqueidentifier] NOT NULL,
	[CardId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Effect] [nvarchar](max) NULL,
	[ToSolve] [nvarchar](max) NULL,
	[Reward] [nvarchar](max) NULL,
	[FlavorText] [nvarchar](max) NULL,
	[Illustrator] [nvarchar](300) NULL,
	[Copyright] [nvarchar](300) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardDetails] PRIMARY KEY CLUSTERED 
(
	[CardDetailId] ASC,
	[CardId] ASC,
	[LanguageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardId] [uniqueidentifier] NOT NULL,
	[CardSetId] [uniqueidentifier] NULL,
	[CardTypeId] [uniqueidentifier] NULL,
	[CardRarityId] [uniqueidentifier] NULL,
	[LessonTypeId] [uniqueidentifier] NULL,
	[LessonCost] [int] NULL,
	[ActionCost] [int] NULL,
	[CardNumber] [nvarchar](50) NULL,
	[Orientation] [nvarchar](50) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardSearchHistory]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardSearchHistory](
	[CardSearchHistoryId] [uniqueidentifier] NOT NULL,
	[CardId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[SearchText] [nvarchar](max) NULL,
	[SetId] [uniqueidentifier] NULL,
	[CardTypeId] [uniqueidentifier] NULL,
	[CardRarityId] [uniqueidentifier] NULL,
	[LanguageId] [uniqueidentifier] NULL,
	[LessonCost] [int] NULL,
	[SortBy] [nvarchar](200) NULL,
	[SortOrder] [nvarchar](200) NULL,
	[SourceId] [uniqueidentifier] NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardSearchHistory] PRIMARY KEY CLUSTERED 
(
	[CardSearchHistoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Set]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Set](
	[SetId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ShortName] [nvarchar](10) NULL,
	[Description] [nvarchar](150) NULL,
	[IconFileName] [nvarchar](200) NULL,
	[Order] [int] NULL,
	[ReleaseDate] [nvarchar](50) NULL,
	[TotalCards] [int] NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Set] PRIMARY KEY CLUSTERED 
(
	[SetId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwSearchHistory]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwSearchHistory]
AS
SELECT
	 History.SearchText AS [Search Text]
	,[Set].Name AS [Set Name]
	,CrdDtl.Name AS [Card Name]
	,History.CreatedDate
FROM
	[CardSearchHistory] AS History
		LEFT JOIN Card AS Crd on Crd.CardId = History.CardId
			LEFT JOIN [Set] ON [Set].SetId = Crd.CardSetId
		LEFT JOIN CardDetail AS CrdDtl ON CrdDtl.CardId = Crd.CardId

GO
/****** Object:  Table [dbo].[Language]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](10) NULL,
	[FlagImagePath] [nvarchar](max) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rarity]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rarity](
	[RarityId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Symbol] [nvarchar](2) NULL,
	[ImageName] [nvarchar](200) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardRarity] PRIMARY KEY CLUSTERED 
(
	[RarityId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonType]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonType](
	[LessonTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ImageName] [nvarchar](500) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_LessonType] PRIMARY KEY CLUSTERED 
(
	[LessonTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwCard]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwCard]
AS
SELECT
	 Crd.CardId
	,Cd.Name
	,Crd.CardNumber
	,Crd.ActionCost
	,Crd.LessonCost
	,Lesson.Name AS [Lesson Type]
	,Rarity.Name AS [Rarity]
	,Crd.Orientation
	,Cd.Text
	,Cd.Effect
	,Cd.ToSolve
	,Cd.Illustrator
	,Cd.FlavorText
	,Cd.Url AS [CardImageUrl]
	,Lang.Name as [Language]
FROM
	dbo.Card as Crd
		INNER JOIN dbo.CardDetail AS Cd on Crd.CardId = Cd.CardId
			INNER JOIN dbo.Language as Lang ON Lang.LanguageId = Cd.LanguageId
		INNER JOIN dbo.LessonType As Lesson ON Lesson.LessonTypeId = Crd.LessonTypeId
		INNER JOIN dbo.Rarity AS Rarity ON Rarity.RarityId = Crd.CardRarityId
GO
/****** Object:  Table [dbo].[CardDetailRuling]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDetailRuling](
	[CardDetailRuleId] [uniqueidentifier] NOT NULL,
	[CardDetailId] [uniqueidentifier] NOT NULL,
	[Rule] [nvarchar](max) NULL,
	[DateOfRuling] [datetime] NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardDetailRuling] PRIMARY KEY CLUSTERED 
(
	[CardDetailRuleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardImage]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardImage](
	[CardImageId] [uniqueidentifier] NOT NULL,
	[ImageId] [uniqueidentifier] NOT NULL,
	[CardId] [uniqueidentifier] NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardImage] PRIMARY KEY CLUSTERED 
(
	[CardImageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardProvidesLesson]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardProvidesLesson](
	[CardProvidesLessonId] [uniqueidentifier] NOT NULL,
	[CardId] [uniqueidentifier] NOT NULL,
	[LessonId] [uniqueidentifier] NOT NULL,
	[Provides] [int] NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardProvidesLesson] PRIMARY KEY CLUSTERED 
(
	[CardProvidesLessonId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardRuling]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardRuling](
	[CardRulingId] [uniqueidentifier] NOT NULL,
	[CardId] [uniqueidentifier] NOT NULL,
	[RulingId] [uniqueidentifier] NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardRuling] PRIMARY KEY CLUSTERED 
(
	[CardRulingId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardSubType]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardSubType](
	[CardSubTypeId] [uniqueidentifier] NOT NULL,
	[SubTypeId] [uniqueidentifier] NOT NULL,
	[CardId] [uniqueidentifier] NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardSubType] PRIMARY KEY CLUSTERED 
(
	[CardSubTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[CardTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CardTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[ImageSizeId] [uniqueidentifier] NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageSize]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageSize](
	[ImageSizeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ImageSize] PRIMARY KEY CLUSTERED 
(
	[ImageSizeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ruling]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ruling](
	[RulingId] [uniqueidentifier] NOT NULL,
	[RulingTypeId] [uniqueidentifier] NOT NULL,
	[RulingSourceId] [uniqueidentifier] NOT NULL,
	[CardTypeId] [uniqueidentifier] NULL,
	[Question] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[Ruling] [nvarchar](max) NULL,
	[GeneralInfo] [nvarchar](max) NULL,
	[RulingDate] [datetime] NULL,
	[LanguageId] [uniqueidentifier] NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Ruling] PRIMARY KEY CLUSTERED 
(
	[RulingId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RulingSource]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RulingSource](
	[RulingSourceId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_RulingSource] PRIMARY KEY CLUSTERED 
(
	[RulingSourceId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RulingType]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RulingType](
	[RulingTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_RulingType] PRIMARY KEY CLUSTERED 
(
	[RulingTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetLanguage]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetLanguage](
	[SetLanguageId] [uniqueidentifier] NOT NULL,
	[SetId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SetLanguage] PRIMARY KEY CLUSTERED 
(
	[SetLanguageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Source]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source](
	[SourceId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Source] PRIMARY KEY CLUSTERED 
(
	[SourceId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubType]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubType](
	[SubTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SubType] PRIMARY KEY CLUSTERED 
(
	[SubTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardDetail] ADD  CONSTRAINT [DF_CardDetails_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardDetailRuling] ADD  CONSTRAINT [DF_CardDetailRuling_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardImage] ADD  CONSTRAINT [DF_CardImage_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardProvidesLesson] ADD  CONSTRAINT [DF_CardProvidesLesson_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardRuling] ADD  CONSTRAINT [DF_CardRuling_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardSearchHistory] ADD  CONSTRAINT [DF_CardSearchHistory_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardSubType] ADD  CONSTRAINT [DF_CardSubType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CardType] ADD  CONSTRAINT [DF_CardType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ImageSize] ADD  CONSTRAINT [DF_ImageSize_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[LessonType] ADD  CONSTRAINT [DF_LessonType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Rarity] ADD  CONSTRAINT [DF_CardRarity_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Ruling] ADD  CONSTRAINT [DF_Ruling_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[RulingSource] ADD  CONSTRAINT [DF_RulingSource_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[RulingType] ADD  CONSTRAINT [DF_RulingType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Set] ADD  CONSTRAINT [DF_Set_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SetLanguage] ADD  CONSTRAINT [DF_SetLanguage_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[SetLanguage] ADD  CONSTRAINT [DF_SetLanguage_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Source] ADD  CONSTRAINT [DF_Source_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SubType] ADD  CONSTRAINT [DF_SubType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
/****** Object:  StoredProcedure [dbo].[GetPopularCardIds]    Script Date: 8/2/2020 10:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Ernest Perez Jr
-- Create Date: 2020-07-02
-- Description: Gets the IDs of the most often clicked on cards
-- =============================================
CREATE PROCEDURE [dbo].[GetPopularCardIds]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 10
		CardId
	FROM
		dbo.CardSearchHistory AS Hist
	WHERE
		Hist.CardId IS NOT NULL
	GROUP BY
		CardId
	ORDER BY
		COUNT(CardId) DESC
END
GO
