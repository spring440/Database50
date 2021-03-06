USE [s17guest50]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Schedule', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Room', N'COLUMN',N'location'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'location'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Room', N'COLUMN',N'roomName'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'roomName'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', N'COLUMN',N'duration'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'duration'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', N'COLUMN',N'description'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'description'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', N'COLUMN',N'title'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'title'

GO
DROP PROCEDURE IF EXISTS [dbo].[insertPresentationOld]
GO
DROP PROCEDURE IF EXISTS [dbo].[sp_selectPresentation]
GO
DROP PROCEDURE IF EXISTS [dbo].[sp_randomeventsponsor]
GO
DROP PROCEDURE IF EXISTS [dbo].[sp_presentationsPerTrack]
GO
DROP PROCEDURE IF EXISTS [dbo].[insertPresentation2]
GO
DROP PROCEDURE IF EXISTS [dbo].[insertPresentation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venue]') AND type in (N'U'))
ALTER TABLE [dbo].[Venue] DROP CONSTRAINT IF EXISTS [Venue_Address_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT IF EXISTS [Schedule_Presentation_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room]') AND type in (N'U'))
ALTER TABLE [dbo].[Room] DROP CONSTRAINT IF EXISTS [Room_Venue_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PresentationProposal]') AND type in (N'U'))
ALTER TABLE [dbo].[PresentationProposal] DROP CONSTRAINT IF EXISTS [PresentationProposal_Person_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PresentationProposal]') AND type in (N'U'))
ALTER TABLE [dbo].[PresentationProposal] DROP CONSTRAINT IF EXISTS [PresentationProposal_Event_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[Presentation] DROP CONSTRAINT IF EXISTS [Presentation_Track_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[Presentation] DROP CONSTRAINT IF EXISTS [Presentation_Room_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[Presentation] DROP CONSTRAINT IF EXISTS [Presentation_Person_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[Presentation] DROP CONSTRAINT IF EXISTS [Presentation_Event_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonRole]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonRole] DROP CONSTRAINT IF EXISTS [PersonRole_Role_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonRole]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonRole] DROP CONSTRAINT IF EXISTS [PersonRole_Person_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonPresentation]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonPresentation] DROP CONSTRAINT IF EXISTS [PersonPresentation_Presentation_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonPresentation]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonPresentation] DROP CONSTRAINT IF EXISTS [PersonEvent_Person_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonEmail]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonEmail] DROP CONSTRAINT IF EXISTS [PersonEmail_Email_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonEmail]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonEmail] DROP CONSTRAINT IF EXISTS [FK_PersonEmail_Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonAddress]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonAddress] DROP CONSTRAINT IF EXISTS [PersonAddress_Person_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonAddress]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonAddress] DROP CONSTRAINT IF EXISTS [PersonAddress_Address_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSponsor]') AND type in (N'U'))
ALTER TABLE [dbo].[EventSponsor] DROP CONSTRAINT IF EXISTS [EventSponsor_Sponsor_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSponsor]') AND type in (N'U'))
ALTER TABLE [dbo].[EventSponsor] DROP CONSTRAINT IF EXISTS [EventSponsor_Event_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
ALTER TABLE [dbo].[Event] DROP CONSTRAINT IF EXISTS [Event_Venue_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Class]') AND type in (N'U'))
ALTER TABLE [dbo].[Class] DROP CONSTRAINT IF EXISTS [Class_Presentation_ID_fk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Class]') AND type in (N'U'))
ALTER TABLE [dbo].[Class] DROP CONSTRAINT IF EXISTS [Class_duration_default]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Class]') AND type in (N'U'))
ALTER TABLE [dbo].[Class] DROP CONSTRAINT IF EXISTS [DF__Class__Title__286302EC]
GO
DROP TABLE IF EXISTS [dbo].[Venue]
GO
DROP TABLE IF EXISTS [dbo].[Track]
GO
DROP TABLE IF EXISTS [dbo].[Sponsor]
GO
DROP TABLE IF EXISTS [dbo].[Schedule]
GO
DROP TABLE IF EXISTS [dbo].[Room]
GO
DROP TABLE IF EXISTS [dbo].[Role]
GO
DROP TABLE IF EXISTS [dbo].[PresentationProposal]
GO
DROP TABLE IF EXISTS [dbo].[Presentation]
GO
DROP TABLE IF EXISTS [dbo].[PersonRole]
GO
DROP TABLE IF EXISTS [dbo].[PersonPresentation]
GO
DROP TABLE IF EXISTS [dbo].[PersonEmail]
GO
DROP TABLE IF EXISTS [dbo].[PersonAddress]
GO
DROP TABLE IF EXISTS [dbo].[Person]
GO
DROP TABLE IF EXISTS [dbo].[EventSponsor]
GO
DROP TABLE IF EXISTS [dbo].[Event]
GO
DROP TABLE IF EXISTS [dbo].[Email]
GO
DROP TABLE IF EXISTS [dbo].[Class]
GO
DROP TABLE IF EXISTS [dbo].[Address]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](95) NULL,
	[city] [nvarchar](45) NULL,
	[zipPostal] [varchar](18) NULL,
	[stateProvinceCountry] [nvarchar](30) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Class]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Class](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](70) NULL,
	[description] [varchar](250) NULL,
	[duration] [smallint] NOT NULL,
	[presentationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Email]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Email](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
 CONSTRAINT [Email_ID_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](95) NULL,
	[region] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[venueID] [int] NULL,
 CONSTRAINT [PK__Event__3214EC275E66F9BC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSponsor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventSponsor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[eventID] [int] NULL,
	[sponsorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonAddress](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NULL,
	[addressID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonEmail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonEmail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[emailID] [int] NULL,
	[personID] [int] NULL,
 CONSTRAINT [PK_PersonEmail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonPresentation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonPresentation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[presentationID] [int] NULL,
	[personID] [int] NULL,
 CONSTRAINT [PK_EventPerson] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NULL,
	[roleID] [int] NULL,
 CONSTRAINT [PK_PersonRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presentation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Presentation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](145) NULL,
	[level] [varchar](19) NULL,
	[event] [varchar](12) NULL,
	[eventID] [int] NULL,
	[roomID] [int] NULL,
	[trackID] [int] NULL,
	[speakerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PresentationProposal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PresentationProposal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](145) NULL,
	[speaker] [varchar](45) NULL,
	[level] [varchar](19) NULL,
	[event] [varchar](12) NULL,
	[eventID] [int] NULL,
	[speakerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[roomName] [varchar](50) NULL,
	[venueID] [int] NULL,
	[location] [varchar](255) NULL,
	[occupancy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[presentationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sponsor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sponsor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[tier] [varchar](20) NULL,
 CONSTRAINT [PK_Sponsor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Track]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Track](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](95) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NULL,
	[addressID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (1, N'10 Napa Ct.', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (2, N'1000 Bidweld Street', N'Haney', N'V2W 1W2', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (3, N'1002 N. Spoonwood Court', N'Hervey Bay', N'4655', N'Queensland')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (4, N'1003 Matterhorn Ct', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (5, N'1005 Matterhorn Ct.', N'Cambridge', N'CB4 4BZ', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (6, N'1005 Matterhorn Ct.', N'Mill Valley', N'94941', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (7, N'1005 Tanager Court', N'Corvallis', N'97330', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (8, N'1005 Tanager Court', N'Milsons Point', N'2061', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (9, N'1006 Deercreek Ln', N'Bellflower', N'90706', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (10, N'1006 Deercreek Ln', N'Torrance', N'90505', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (11, N'101 Adobe Dr', N'Coffs Harbour', N'2450', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (12, N'101 Adobe Dr', N'Puyallup', N'98371', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (13, N'101, avenue de la Gare', N'Peterborough', N'PB12', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (14, N'1010 Maple', N'Baltimore', N'21201', N'Maryland')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (15, N'1011 Yolanda Circle', N'Berkeley', N'94704', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (16, N'1011 Yolanda Circle', N'N. Vancouver', N'V7L 4J4', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (17, N'1013 Holiday Hills Dr.', N'Bremerton', N'98312', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (18, N'1013 Holiday Hills Dr.', N'Gateshead', N'GA10', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (19, N'1015 Lynwood Drive', N'Metchosin', N'V9', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (20, N'1019 Carletto Drive', N'Berkeley', N'94704', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (21, N'1019 Mt. Davidson Court', N'Burien', N'98168', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (22, N'1019 Mt. Davidson Court', N'London', N'SW8 4BG', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (23, N'102 Vista Place', N'Santa Monica', N'90401', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (24, N'1020 Book Road', N'Bremerton', N'98312', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (25, N'1020 Carletto Drive', N'Matraville', N'2036', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (26, N'1020 Carletto Drive', N'Santa Cruz', N'95062', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (27, N'1023 Hawkins Street', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (28, N'1024 Walnut Blvd.', N'Colma', N'94014', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (29, N'1025 Holly Oak Drive', N'Leeds', N'LE18', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (30, N'1025 R St.', N'Kirkland', N'98033', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (31, N'1025 Yosemite Dr.', N'Oregon City', N'97045', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (32, N'1028 Green View Court', N'Chula Vista', N'91910', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (33, N'1028 Green View Court', N'Oregon City', N'97045', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (34, N'1037 Hayes Court', N'Stoke-on-Trent', N'AS23', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (35, N'1039 Adelaide St.', N'West Covina', N'91791', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (36, N'104 Hilltop Dr.', N'Springwood', N'2777', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (37, N'104 Kaski Ln.', N'Portland', N'97205', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (38, N'1040 Greenbush Drive', N'Silverwater', N'2264', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (39, N'1040 Northridge Road', N'London', N'W1X3SE', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (40, N'1044 San Carlos', N'Cincinnati', N'45202', N'Ohio')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (41, N'1045 Lolita Drive', N'Torrance', N'90505', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (42, N'1045 Lolita Drive', N'Townsville', N'4810', N'Queensland')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (43, N'1047 Las Quebradas Lane', N'North Sydney', N'2055', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (44, N'1048 Burwood Way', N'Hervey Bay', N'4655', N'Queensland')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (45, N'1048 Las Quebradas Lane', N'Walla Walla', N'99362', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (46, N'1048 Las Quebradas Lane', N'Wollongong', N'2500', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (47, N'105 Clark Creek Lane', N'Port Macquarie', N'2444', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (48, N'105 Woodruff Ln.', N'Bellingham', N'98225', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (49, N'1050 Creed Ave', N'London', N'W10 6BL', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (50, N'081, boulevard du Montparnasse', N'Seattle', N'98104', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (51, N'1 Smiling Tree Court', N'Los Angeles', N'90012', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (52, N'100, rue des Rosiers', N'Everett', N'98201', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (53, N'1002 N. Spoonwood Court', N'Berkeley', N'94704', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (54, N'1005 Fremont Street', N'Colma', N'94014', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (55, N'1005 Valley Oak Plaza', N'Langley', N'V3A 4R2', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (56, N'1005 Valley Oak Plaza', N'London', N'SW6 SBY', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (57, N'1007 Cardinet Dr.', N'El Cajon', N'92020', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (58, N'1008 Lydia Lane', N'Burbank', N'91502', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (59, N'101 Candy Rd.', N'Redmond', N'98052', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (60, N'1011 Green St.', N'Bellingham', N'98225', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (61, N'1013 Buchanan Rd', N'Port Macquarie', N'2444', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (62, N'1013 Buchanan Rd', N'Yakima', N'98901', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (63, N'1016 Park Avenue', N'Burbank', N'91502', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (64, N'1019 Book Road', N'Rhodes', N'2138', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (65, N'1019 Buchanan Road', N'Woodland Hills', N'91364', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (66, N'1019 Candy Rd.', N'Coffs Harbour', N'2450', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (67, N'1019 Chance Drive', N'Sedro Woolley', N'98284', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (68, N'1019 Kenwal Rd.', N'Lake Oswego', N'97034', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (69, N'1019 Pennsylvania Blvd', N'Marysville', N'98270', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (70, N'102 Vista Place', N'Milton Keynes', N'MK8 8DF', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (71, N'10203 Acorn Avenue', N'Calgary', N'T2P 2G8', N'Alberta')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (72, N'1023 Hawkins Street', N'Townsville', N'4810', N'Queensland')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (73, N'1023 Riveria Way', N'Burbank', N'91502', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (74, N'1023 Riviera Way', N'Oxford', N'OX1', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (75, N'1025 Yosemite Dr.', N'Townsville', N'4810', N'Queensland')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (76, N'1026 Mt. Wilson Pl.', N'Lynnwood', N'98036', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (77, N'1026 Mt. Wilson Pl.', N'South Melbourne', N'3205', N'Victoria')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (78, N'1028 Indigo Ct.', N'Issaquah', N'98027', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (79, N'1028 Indigo Ct.', N'Warrnambool', N'3280', N'Victoria')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (80, N'1028 Royal Oak Rd.', N'Burlingame', N'94010', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (81, N'1029 Birchwood Dr', N'Burien', N'98168', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (82, N'1029 Birchwood Dr', N'Olympia', N'98501', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (83, N'1030 Ambush Dr.', N'Bury', N'PE17', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (84, N'1032 Buena Vista', N'North Ryde', N'2113', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (85, N'1032 Coats Road', N'Stoke-on-Trent', N'AS23', N'England')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (86, N'1035 Arguello Blvd.', N'San Diego', N'92102', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (87, N'1036 Mason Dr', N'Port Orchard', N'98366', N'Washington')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (88, N'1039 Adelaide St.', N'Port Macquarie', N'2444', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (89, N'104 Hilltop Dr.', N'Concord', N'94519', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (90, N'1040 Greenbush Drive', N'Newton', N'V2L3W8', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (91, N'1040 Northridge Road', N'Woodland Hills', N'91364', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (92, N'1042 Hooftrail Way', N'Newcastle', N'2300', N'New South Wales')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (93, N'1046 Cloverleaf Circle', N'Shawnee', N'V8Z 4N5', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (94, N'1046 San Carlos Avenue', N'Colma', N'94014', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (95, N'1047 Las Quebradas Lane', N'Oak Bay', N'V8P', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (96, N'1048 Burwood Way', N'Haney', N'V2W 1W2', N'British Columbia')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (97, N'105 Woodruff Ln.', N'Oakland', N'94611', N'California')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (98, N'1050 Creed Ave', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (99, N'1050 Greenhills Circle', N'Lane Cove', N'1597', N'New South Wales')
GO
INSERT [dbo].[Address] ([ID], [street], [city], [zipPostal], [stateProvinceCountry]) VALUES (100, N'1050 Greenhills Circle', N'Langley', N'V3A 4R2', N'British Columbia')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Email] ON 

INSERT [dbo].[Email] ([ID], [email]) VALUES (1, N'ALong@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (2, N'CShan@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (3, N'TSara@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (4, N'KBaker@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (5, N'SMa@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (6, N'AJones@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (7, N'CBaker@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (8, N'TMunoz@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (9, N'TGill@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (10, N'ALee@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (11, N'ESuri@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (12, N'MEvans@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (13, N'MClark@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (14, N'GXu@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (15, N'PRubio@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (16, N'JIsla@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (17, N'JScott@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (18, N'NSanz@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (19, N'ILee@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (20, N'DYuan@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (21, N'OBlue@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (22, N'ELopez@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (23, N'NYang@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (24, N'GWood@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (25, N'KAnand@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (26, N'AJones@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (27, N'NReed@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (28, N'DRoss@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (29, N'SGoel@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (30, N'NDiaz@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (31, N'WDavis@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (32, N'CHuang@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (33, N'SEvans@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (34, N'KBaker@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (35, N'EWood@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (36, N'JRai@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (37, N'EMoore@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (38, N'RYang@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (39, N'RRuiz@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (40, N'MSun@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (41, N'GPerez@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (42, N'EGill@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (43, N'KShen@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (44, N'SYuan@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (45, N'VLee@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (46, N'BArun@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (47, N'AScott@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (48, N'YLuo@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (49, N'MVance@gmail.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (50, N'JRoberts@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (51, N'ARamirez@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (52, N'JNelson@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (53, N'HWright@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (54, N'SWright@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (55, N'SSimmons@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (56, N'MSamant@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (57, N'IRogers@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (58, N'IFoster@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (59, N'BMiller@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (60, N'SBarnes@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (61, N'CMartin@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (62, N'VMurphy@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (63, N'SRogers@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (64, N'MHernandez@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (65, N'CCarter@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (66, N'RGarcia@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (67, N'HHenderson@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (68, N'JTaylor@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (69, N'SMartin@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (70, N'LSuarez@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (71, N'GVargas@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (72, N'AMartinez@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (73, N'JThomas@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (74, N'EMartinez@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (75, N'PChapman@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (76, N'KGriffin@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (77, N'JNavarro@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (78, N'NWalker@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (79, N'TMoreno@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (80, N'MSanchez@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (81, N'NNavarro@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (82, N'KRussell@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (83, N'KRivera@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (84, N'AOrtega@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (85, N'ACampbell@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (86, N'JPeterson@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (87, N'ARamirez@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (88, N'MSharma@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (89, N'ACollins@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (90, N'TMartin@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (91, N'GCollins@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (92, N'RMartin@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (93, N'SJenkins@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (94, N'JSimmons@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (95, N'EWinston@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (96, N'HRoberts@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (97, N'NMurphy@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (98, N'CWilson@yahoo.com')
INSERT [dbo].[Email] ([ID], [email]) VALUES (99, N'CAlvarez@yahoo.com')
GO
INSERT [dbo].[Email] ([ID], [email]) VALUES (100, N'PAlexander@yahoo.com')
SET IDENTITY_INSERT [dbo].[Email] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (1, N'SQLSaturday #626 - Budapest 2017', N'Europe/Middle East/Africa', CAST(N'2017-05-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (2, N'SQLSaturday #615 - Baltimore 2017', N'Canada/US', CAST(N'2017-05-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (3, N'SQLSaturday #608 - Bogota 2017', N'Latin America', CAST(N'2017-05-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (4, N'SQLSaturday #616 - Kyiv 2017', N'Europe/Middle East/Africa', CAST(N'2017-05-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (5, N'SQLSaturday #588 - New York City 2017', N'Canada/US', CAST(N'2017-05-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (6, N'SQLSaturday #630 - Brisbane 2017', N'Asia Pacific', CAST(N'2017-05-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (7, N'SQLSaturday #599 - Plovdiv 2017', N'Europe/Middle East/Africa', CAST(N'2017-05-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Event] ([ID], [name], [region], [date], [venueID]) VALUES (8, N'SQLSaturday #638 - Philadelphia 2017', N'Canada/US', CAST(N'2017-06-03T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[EventSponsor] ON 

INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (1, 6, 4)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (2, 2, 12)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (3, 1, 4)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (4, 2, 11)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (5, 1, 1)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (6, 4, 15)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (7, 2, 10)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (8, 8, 4)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (9, 6, 1)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (10, 2, 12)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (11, 5, 6)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (12, 2, 10)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (13, 7, 13)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (14, 6, 12)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (15, 4, 3)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (16, 5, 6)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (17, 7, 11)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (18, 1, 12)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (19, 1, 6)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (20, 4, 12)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (21, 1, 7)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (22, 7, 15)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (23, 2, 2)
INSERT [dbo].[EventSponsor] ([ID], [eventID], [sponsorID]) VALUES (24, 4, 4)
SET IDENTITY_INSERT [dbo].[EventSponsor] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (1, N'Amanda', N'Long')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (2, N'Christian', N'Shan')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (3, N'Troy', N'Sara')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (4, N'Kaitlyn', N'Baker')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (5, N'Suzanne', N'Ma')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (6, N'Anna', N'Jones')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (7, N'Carlos', N'Baker')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (8, N'Tanya', N'Munoz')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (9, N'Tabitha', N'Gill')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (10, N'Alexis', N'Lee')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (11, N'Erick', N'Suri')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (12, N'Marcus', N'Evans')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (13, N'Marcus', N'Clark')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (14, N'Gilbert', N'Xu')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (15, N'Paula', N'Rubio')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (16, N'Julian', N'Isla')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (17, N'Jesse', N'Scott')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (18, N'Naomi', N'Sanz')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (19, N'Isabella', N'Lee')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (20, N'Dawn', N'Yuan')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (21, N'Olivia', N'Blue')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (22, N'Emmanuel', N'Lopez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (23, N'Nathan', N'Yang')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (24, N'Gabrielle', N'Wood')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (25, N'Katrina', N'Anand')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (26, N'Anthony', N'Jones')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (27, N'Natalie', N'Reed')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (28, N'Dakota', N'Ross')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (29, N'Shawn', N'Goel')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (30, N'Nicole', N'Diaz')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (31, N'Wyatt', N'Davis')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (32, N'Christy', N'Huang')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (33, N'Sydney', N'Evans')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (34, N'Katherine', N'Baker')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (35, N'Edward', N'Wood')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (36, N'Johnny', N'Rai')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (37, N'Emily', N'Moore')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (38, N'Randy', N'Yang')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (39, N'Roy', N'Ruiz')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (40, N'Marshall', N'Sun')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (41, N'Gabriella', N'Perez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (42, N'Erika', N'Gill')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (43, N'Kathryn', N'Shen')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (44, N'Sharon', N'Yuan')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (45, N'Victoria', N'Lee')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (46, N'Brenda', N'Arun')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (47, N'Alex', N'Scott')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (48, N'Yolanda', N'Luo')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (49, N'Martin', N'Vance')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (50, N'Jeremy', N'Roberts')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (51, N'Amanda', N'Ramirez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (52, N'Jada', N'Nelson')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (53, N'Hunter', N'Wright')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (54, N'Sierra', N'Wright')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (55, N'Sarah', N'Simmons')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (56, N'Mandar', N'Samant')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (57, N'Isaiah', N'Rogers')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (58, N'Ian', N'Foster')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (59, N'Ben', N'Miller')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (60, N'Sarah', N'Barnes')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (61, N'Casey', N'Martin')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (62, N'Victoria', N'Murphy')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (63, N'Sydney', N'Rogers')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (64, N'Marvin', N'Hernandez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (65, N'Carlos', N'Carter')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (66, N'Rebekah', N'Garcia')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (67, N'Haley', N'Henderson')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (68, N'Jacob', N'Taylor')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (69, N'Seth', N'Martin')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (70, N'Larry', N'Suarez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (71, N'Garrett', N'Vargas')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (72, N'Abby', N'Martinez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (73, N'Justin', N'Thomas')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (74, N'Evelyn', N'Martinez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (75, N'Pamela', N'Chapman')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (76, N'Kayla', N'Griffin')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (77, N'Jill', N'Navarro')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (78, N'Nathan', N'Walker')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (79, N'Tabitha', N'Moreno')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (80, N'Mason', N'Sanchez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (81, N'Natasha', N'Navarro')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (82, N'Kevin', N'Russell')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (83, N'Katelyn', N'Rivera')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (84, N'Alfredo', N'Ortega')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (85, N'Andrea', N'Campbell')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (86, N'Jeremy', N'Peterson')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (87, N'Arianna', N'Ramirez')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (88, N'Mario', N'Sharma')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (89, N'Adam', N'Collins')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (90, N'Taylor', N'Martin')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (91, N'Gabriel', N'Collins')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (92, N'Randall', N'Martin')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (93, N'Samantha', N'Jenkins')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (94, N'Justin', N'Simmons')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (95, N'Ethan', N'Winston')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (96, N'Hunter', N'Roberts')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (97, N'Nathaniel', N'Murphy')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (98, N'Charles', N'Wilson')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (99, N'Carrie', N'Alvarez')
GO
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (100, N'Paige', N'Alexander')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (401, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (402, N'Jeremiah', N'Peschka')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (403, N'Jeremiah', N'Peschka')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (404, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (405, N'Chris', N'Seferlis')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (406, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (407, N'Mohammad', N'Yusuf')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (408, N'Kennie', N'Pontoppidan')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (409, N'John', N'Sterrett')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (410, N'Thomas', N'Grohser')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (411, N'Thomas', N'Grohser')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (412, N'Joe', N'Chang')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (413, N'Joe', N'Chang')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (414, N'Michael', N'Wharton')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (415, N'Sunil', N'Kadimdiwan')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (416, N'Mike', N'Walsh')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (417, N'John', N'Miner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (418, N'John', N'Miner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (419, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (420, N'Joseph', N'D''Antoni')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (421, N'Paresh', N'Motiwala')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (422, N'Mickey', N'Stuewe')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (423, N'John', N'Miner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (424, N'Stacia', N'Misner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (425, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (426, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (427, N'David', N'Hansen')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (428, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (429, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (430, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (431, N'Mickey', N'Stuewe')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (432, N'Allan', N'Technology')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (433, N'Allan', N'Hirt')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (434, N'SQLSatruday', N'364')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (435, N'Robert', N'Pearl')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (436, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (437, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (438, N'John', N'Flannery')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (439, N'John', N'Flannery')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (440, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (441, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (442, N'Edward', N'Pollack')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (443, N'Mohammad', N'Yusuf')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (444, N'Michael', N'Corey')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (445, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (446, N'Robert', N'Pearl')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (447, N'Gigi', N'Bell')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (448, N'John', N'Flannery')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (449, N'Allan', N'Hirt')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (450, N'Jason', N'Horner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (451, N'Jason', N'Horner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (452, N'Edward', N'Pollack')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (453, N'Edward', N'Pollack')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (454, N'Brent', N'Ozar')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (455, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (456, N'Thomas', N'Grohser')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (457, N'Paul', N'Rizza')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (458, N'SQLSaturday', N'364')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (459, N'Grant', N'Fritchey')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (460, N'Sayed', N'Saeed')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (461, N'John', N'Miner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (462, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (463, N'Paul', N'Rizza')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (464, N'Stéphane', N'Fréchette')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (465, N'Chris', N'Bell')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (466, N'Andy', N'Leonard')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (467, N'Varsham', N'Papikian')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (468, N'David', N'Bermingham')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (469, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (470, N'Brent', N'Ozar')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (471, N'George', N'Walters')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (472, N'Allan', N'Hirt')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (473, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (474, N'Jack', N'Corbett')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (475, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (476, N'David', N'Hansen')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (477, N'Stacia', N'Misner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (478, N'John', N'Flannery')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (479, N'John', N'Sterrett')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (480, N'John', N'Sterrett')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (481, N'Brandon', N'Leach')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (482, N'Brandon', N'Leach')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (483, N'Allan', N'Hirt')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (484, N'Jeremiah', N'Peschka')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (485, N'SQLSaturday', N'364')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (486, N'SQLSaturday', N'364')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (487, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (488, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (489, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (490, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (491, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (492, N'Hilary', N'Cotter')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (493, N'Stacia', N'Misner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (494, N'Jason', N'Brimhall')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (495, N'Mike', N'Walsh')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (496, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (497, N'Kevin', N'Schenega')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (498, N'Chris', N'Bell')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (499, N'Kennie', N'Pontoppidan')
GO
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (500, N'Todd', N'Chittenden')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (501, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (502, N'Michael', N'Wharton')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (503, N'Jason', N'Horner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (504, N'Chris', N'Bell')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (505, N'Edward', N'Pollack')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (506, N'SQLSaturday', NULL)
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (507, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (508, N'Mike', N'Hillwig')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (509, N'Stacia', N'Misner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (510, N'SQLSaturday', NULL)
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (511, N'Hilary', N'Cotter')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (512, N'Jason', N'Brimhall')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (513, N'Hilary', N'Cotter')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (514, N'Hilary', N'Cotter')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (515, N'Stéphane', N'Fréchette')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (516, N'Paul', N'Rizza')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (517, N'Allan', N'Hirt')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (518, N'Kennie', N'Pontoppidan')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (519, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (520, N'George', N'Walters')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (521, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (522, N'George', N'Walters')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (523, N'George', N'Walters')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (524, N'David', N'Hansen')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (525, N'Jason', N'Brimhall')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (526, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (527, N'Steve', N'Simon')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (528, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (529, N'Thomas', N'Grohser')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (530, N'Brandon', N'Leach')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (531, N'Andy', N'Leonard')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (532, N'Carl', N'Berglund')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (533, N'Hilary', N'Cotter')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (534, N'John', N'Miner')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (535, N'Melissa', N'Riley')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (536, N'Adam', N'Jorgensen')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (537, N'Dennis', N'Messina')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (538, N'Richie', N'Rump')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (539, N'Chris', N'Bell')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (540, N'Jack', N'Corbett')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (541, N'Aaron', N'Bertrand')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (542, N'Greg', N'Moore')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (543, N'Aaron', N'Bertrand')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (544, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (545, N'Grant', N'Fritchey')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (546, N'Jason', N'Brimhall')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (547, N'Brent', N'Ozar')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (548, N'David', N'Bermingham')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (549, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (550, N'James', N'Serra')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (551, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (552, N'Paresh', N'Motiwala')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (553, N'Kevin', N'Goff')
INSERT [dbo].[Person] ([ID], [firstName], [lastName]) VALUES (554, N'Mike', N'Walsh')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[PersonAddress] ON 

INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (102, 1, 1)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (103, 2, 2)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (104, 3, 3)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (105, 4, 4)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (106, 5, 5)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (107, 6, 6)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (108, 7, 7)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (109, 8, 8)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (110, 9, 9)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (111, 10, 10)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (112, 11, 11)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (113, 12, 12)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (114, 13, 13)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (115, 14, 14)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (116, 15, 15)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (117, 16, 16)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (118, 17, 17)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (119, 18, 18)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (120, 19, 19)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (121, 20, 20)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (122, 21, 21)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (123, 22, 22)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (124, 23, 23)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (125, 24, 24)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (126, 25, 25)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (127, 26, 26)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (128, 27, 27)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (129, 28, 28)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (130, 29, 29)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (131, 30, 30)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (132, 31, 31)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (133, 32, 32)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (134, 33, 33)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (135, 34, 34)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (136, 35, 35)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (137, 36, 36)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (138, 37, 37)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (139, 38, 38)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (140, 39, 39)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (141, 40, 40)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (142, 41, 41)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (143, 42, 42)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (144, 43, 43)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (145, 44, 44)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (146, 45, 45)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (147, 46, 46)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (148, 47, 47)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (149, 48, 48)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (150, 49, 49)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (151, 50, 50)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (152, 51, 51)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (153, 52, 52)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (154, 53, 53)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (155, 54, 54)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (156, 55, 55)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (157, 56, 56)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (158, 57, 57)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (159, 58, 58)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (160, 59, 59)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (161, 60, 60)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (162, 61, 61)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (163, 62, 62)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (164, 63, 63)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (165, 64, 64)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (166, 65, 65)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (167, 66, 66)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (168, 67, 67)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (169, 68, 68)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (170, 69, 69)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (171, 70, 70)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (172, 71, 71)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (173, 72, 72)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (174, 73, 73)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (175, 74, 74)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (176, 75, 75)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (177, 76, 76)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (178, 77, 77)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (179, 78, 78)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (180, 79, 79)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (181, 80, 80)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (182, 81, 81)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (183, 82, 82)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (184, 83, 83)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (185, 84, 84)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (186, 85, 85)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (187, 86, 86)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (188, 87, 87)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (189, 88, 88)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (190, 89, 89)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (191, 90, 90)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (192, 91, 91)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (193, 92, 92)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (194, 93, 93)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (195, 94, 94)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (196, 95, 95)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (197, 96, 96)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (198, 97, 97)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (199, 98, 98)
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (200, 99, 99)
GO
INSERT [dbo].[PersonAddress] ([ID], [personID], [addressID]) VALUES (201, 100, 100)
SET IDENTITY_INSERT [dbo].[PersonAddress] OFF
SET IDENTITY_INSERT [dbo].[PersonEmail] ON 

INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (103, 1, 1)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (104, 2, 2)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (105, 3, 3)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (106, 4, 4)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (107, 5, 5)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (108, 6, 6)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (109, 7, 7)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (110, 8, 8)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (111, 9, 9)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (112, 10, 10)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (113, 11, 11)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (114, 12, 12)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (115, 13, 13)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (116, 14, 14)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (117, 15, 15)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (118, 16, 16)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (119, 17, 17)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (120, 18, 18)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (121, 19, 19)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (122, 20, 20)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (123, 21, 21)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (124, 22, 22)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (125, 23, 23)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (126, 24, 24)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (127, 25, 25)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (128, 26, 26)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (129, 27, 27)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (130, 28, 28)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (131, 29, 29)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (132, 30, 30)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (133, 31, 31)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (134, 32, 32)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (135, 33, 33)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (136, 34, 34)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (137, 35, 35)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (138, 36, 36)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (139, 37, 37)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (140, 38, 38)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (141, 39, 39)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (142, 40, 40)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (143, 41, 41)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (144, 42, 42)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (145, 43, 43)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (146, 44, 44)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (147, 45, 45)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (148, 46, 46)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (149, 47, 47)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (150, 48, 48)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (151, 49, 49)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (152, 50, 50)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (153, 51, 51)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (154, 52, 52)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (155, 53, 53)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (156, 54, 54)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (157, 55, 55)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (158, 56, 56)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (159, 57, 57)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (160, 58, 58)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (161, 59, 59)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (162, 60, 60)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (163, 61, 61)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (164, 62, 62)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (165, 63, 63)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (166, 64, 64)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (167, 65, 65)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (168, 66, 66)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (169, 67, 67)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (170, 68, 68)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (171, 69, 69)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (172, 70, 70)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (173, 71, 71)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (174, 72, 72)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (175, 73, 73)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (176, 74, 74)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (177, 75, 75)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (178, 76, 76)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (179, 77, 77)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (180, 78, 78)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (181, 79, 79)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (182, 80, 80)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (183, 81, 81)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (184, 82, 82)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (185, 83, 83)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (186, 84, 84)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (187, 85, 85)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (188, 86, 86)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (189, 87, 87)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (190, 88, 88)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (191, 89, 89)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (192, 90, 90)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (193, 91, 91)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (194, 92, 92)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (195, 93, 93)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (196, 94, 94)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (197, 95, 95)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (198, 96, 96)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (199, 97, 97)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (200, 98, 98)
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (201, 99, 99)
GO
INSERT [dbo].[PersonEmail] ([ID], [emailID], [personID]) VALUES (202, 100, 100)
SET IDENTITY_INSERT [dbo].[PersonEmail] OFF
SET IDENTITY_INSERT [dbo].[PersonPresentation] ON 

INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (1, NULL, 1)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (2, NULL, 2)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (3, NULL, 3)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (4, NULL, 4)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (5, NULL, 5)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (6, NULL, 6)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (7, NULL, 7)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (8, NULL, 8)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (9, NULL, 9)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (10, NULL, 10)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (11, NULL, 11)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (12, NULL, 12)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (13, NULL, 13)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (14, NULL, 14)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (15, NULL, 15)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (16, NULL, 16)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (17, NULL, 17)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (18, NULL, 18)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (19, NULL, 19)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (20, NULL, 20)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (21, NULL, 21)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (22, NULL, 22)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (23, NULL, 23)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (24, NULL, 24)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (25, NULL, 25)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (26, NULL, 26)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (27, NULL, 27)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (28, NULL, 28)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (29, NULL, 29)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (30, NULL, 30)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (31, NULL, 31)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (32, NULL, 32)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (33, NULL, 33)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (34, NULL, 34)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (35, NULL, 35)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (36, NULL, 36)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (37, NULL, 37)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (38, NULL, 38)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (39, NULL, 39)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (40, NULL, 40)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (41, NULL, 41)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (42, NULL, 42)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (43, NULL, 43)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (44, NULL, 44)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (45, NULL, 45)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (46, NULL, 46)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (47, NULL, 47)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (48, NULL, 48)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (49, NULL, 49)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (50, NULL, 50)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (51, NULL, 51)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (52, NULL, 52)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (53, NULL, 53)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (54, NULL, 54)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (55, NULL, 55)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (56, NULL, 56)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (57, NULL, 57)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (58, NULL, 58)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (59, NULL, 59)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (60, NULL, 60)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (61, NULL, 61)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (62, NULL, 62)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (63, NULL, 63)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (64, NULL, 64)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (65, NULL, 65)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (66, NULL, 66)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (67, NULL, 67)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (68, NULL, 68)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (69, NULL, 69)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (70, NULL, 70)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (71, NULL, 71)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (72, NULL, 72)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (73, NULL, 73)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (74, NULL, 74)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (75, NULL, 75)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (76, NULL, 76)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (77, NULL, 77)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (78, NULL, 78)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (79, NULL, 79)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (80, NULL, 80)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (81, NULL, 81)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (82, NULL, 82)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (83, NULL, 83)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (84, NULL, 84)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (85, NULL, 85)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (86, NULL, 86)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (87, NULL, 87)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (88, NULL, 88)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (89, NULL, 89)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (90, NULL, 90)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (91, NULL, 91)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (92, NULL, 92)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (93, NULL, 93)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (94, NULL, 94)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (95, NULL, 95)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (96, NULL, 96)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (97, NULL, 97)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (98, NULL, 98)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (99, NULL, 99)
GO
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (100, NULL, 100)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (101, NULL, 401)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (102, NULL, 402)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (103, NULL, 403)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (104, NULL, 404)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (105, NULL, 405)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (106, NULL, 406)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (107, NULL, 407)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (108, NULL, 408)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (109, NULL, 409)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (110, NULL, 410)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (111, NULL, 411)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (112, NULL, 412)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (113, NULL, 413)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (114, NULL, 414)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (115, NULL, 415)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (116, NULL, 416)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (117, NULL, 417)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (118, NULL, 418)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (119, NULL, 419)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (120, NULL, 420)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (121, NULL, 421)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (122, NULL, 422)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (123, NULL, 423)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (124, NULL, 424)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (125, NULL, 425)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (126, NULL, 426)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (127, NULL, 427)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (128, NULL, 428)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (129, NULL, 429)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (130, NULL, 430)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (131, NULL, 431)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (132, NULL, 432)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (133, NULL, 433)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (134, NULL, 434)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (135, NULL, 435)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (136, NULL, 436)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (137, NULL, 437)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (138, NULL, 438)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (139, NULL, 439)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (140, NULL, 440)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (141, NULL, 441)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (142, NULL, 442)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (143, NULL, 443)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (144, NULL, 444)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (145, NULL, 445)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (146, NULL, 446)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (147, NULL, 447)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (148, NULL, 448)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (149, NULL, 449)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (150, NULL, 450)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (151, NULL, 451)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (152, NULL, 452)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (153, NULL, 453)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (154, NULL, 454)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (155, NULL, 455)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (156, NULL, 456)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (157, NULL, 457)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (158, NULL, 458)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (159, NULL, 459)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (160, NULL, 460)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (161, NULL, 461)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (162, NULL, 462)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (163, NULL, 463)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (164, NULL, 464)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (165, NULL, 465)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (166, NULL, 466)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (167, NULL, 467)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (168, NULL, 468)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (169, NULL, 469)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (170, NULL, 470)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (171, NULL, 471)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (172, NULL, 472)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (173, NULL, 473)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (174, NULL, 474)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (175, NULL, 475)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (176, NULL, 476)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (177, NULL, 477)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (178, NULL, 478)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (179, NULL, 479)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (180, NULL, 480)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (181, NULL, 481)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (182, NULL, 482)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (183, NULL, 483)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (184, NULL, 484)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (185, NULL, 485)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (186, NULL, 486)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (187, NULL, 487)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (188, NULL, 488)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (189, NULL, 489)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (190, NULL, 490)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (191, NULL, 491)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (192, NULL, 492)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (193, NULL, 493)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (194, NULL, 494)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (195, NULL, 495)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (196, NULL, 496)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (197, NULL, 497)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (198, NULL, 498)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (199, NULL, 499)
GO
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (200, NULL, 500)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (201, NULL, 501)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (202, NULL, 502)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (203, NULL, 503)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (204, NULL, 504)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (205, NULL, 505)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (206, NULL, 506)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (207, NULL, 507)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (208, NULL, 508)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (209, NULL, 509)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (210, NULL, 510)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (211, NULL, 511)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (212, NULL, 512)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (213, NULL, 513)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (214, NULL, 514)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (215, NULL, 515)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (216, NULL, 516)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (217, NULL, 517)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (218, NULL, 518)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (219, NULL, 519)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (220, NULL, 520)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (221, NULL, 521)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (222, NULL, 522)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (223, NULL, 523)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (224, NULL, 524)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (225, NULL, 525)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (226, NULL, 526)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (227, NULL, 527)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (228, NULL, 528)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (229, NULL, 529)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (230, NULL, 530)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (231, NULL, 531)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (232, NULL, 532)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (233, NULL, 533)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (234, NULL, 534)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (235, NULL, 535)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (236, NULL, 536)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (237, NULL, 537)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (238, NULL, 538)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (239, NULL, 539)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (240, NULL, 540)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (241, NULL, 541)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (242, NULL, 542)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (243, NULL, 543)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (244, NULL, 544)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (245, NULL, 545)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (246, NULL, 546)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (247, NULL, 547)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (248, NULL, 548)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (249, NULL, 549)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (250, NULL, 550)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (251, NULL, 551)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (252, NULL, 552)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (253, NULL, 553)
INSERT [dbo].[PersonPresentation] ([ID], [presentationID], [personID]) VALUES (254, NULL, 554)
SET IDENTITY_INSERT [dbo].[PersonPresentation] OFF
SET IDENTITY_INSERT [dbo].[PersonRole] ON 

INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (1, 1, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (2, 2, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (3, 3, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (4, 4, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (5, 5, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (6, 6, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (7, 7, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (8, 8, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (9, 9, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (10, 10, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (11, 11, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (12, 12, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (13, 13, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (14, 14, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (15, 15, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (16, 16, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (17, 17, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (18, 18, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (19, 19, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (20, 20, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (21, 21, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (22, 22, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (23, 23, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (24, 24, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (25, 25, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (26, 26, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (27, 27, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (28, 28, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (29, 29, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (30, 30, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (31, 31, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (32, 32, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (33, 33, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (34, 34, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (35, 35, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (36, 36, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (37, 37, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (38, 38, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (39, 39, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (40, 40, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (41, 41, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (42, 42, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (43, 43, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (44, 44, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (45, 45, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (46, 46, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (47, 47, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (48, 48, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (49, 49, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (50, 50, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (51, 51, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (52, 52, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (53, 53, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (54, 54, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (55, 55, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (56, 56, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (57, 57, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (58, 58, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (59, 59, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (60, 60, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (61, 61, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (62, 62, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (63, 63, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (64, 64, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (65, 65, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (66, 66, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (67, 67, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (68, 68, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (69, 69, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (70, 70, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (71, 71, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (72, 72, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (73, 73, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (74, 74, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (75, 75, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (76, 76, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (77, 77, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (78, 78, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (79, 79, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (80, 80, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (81, 81, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (82, 82, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (83, 83, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (84, 84, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (85, 85, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (86, 86, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (87, 87, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (88, 88, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (89, 89, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (90, 90, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (91, 91, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (92, 92, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (93, 93, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (94, 94, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (95, 95, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (96, 96, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (97, 97, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (98, 98, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (99, 99, 2)
GO
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (100, 100, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (101, 401, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (102, 402, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (103, 403, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (104, 404, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (105, 405, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (106, 406, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (107, 407, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (108, 408, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (109, 409, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (110, 410, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (111, 411, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (112, 412, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (113, 413, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (114, 414, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (115, 415, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (116, 416, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (117, 417, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (118, 418, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (119, 419, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (120, 420, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (121, 421, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (122, 422, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (123, 423, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (124, 424, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (125, 425, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (126, 426, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (127, 427, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (128, 428, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (129, 429, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (130, 430, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (131, 431, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (132, 432, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (133, 433, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (134, 434, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (135, 435, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (136, 436, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (137, 437, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (138, 438, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (139, 439, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (140, 440, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (141, 441, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (142, 442, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (143, 443, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (144, 444, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (145, 445, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (146, 446, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (147, 447, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (148, 448, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (149, 449, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (150, 450, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (151, 451, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (152, 452, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (153, 453, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (154, 454, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (155, 455, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (156, 456, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (157, 457, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (158, 458, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (159, 459, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (160, 460, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (161, 461, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (162, 462, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (163, 463, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (164, 464, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (165, 465, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (166, 466, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (167, 467, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (168, 468, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (169, 469, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (170, 470, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (171, 471, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (172, 472, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (173, 473, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (174, 474, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (175, 475, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (176, 476, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (177, 477, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (178, 478, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (179, 479, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (180, 480, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (181, 481, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (182, 482, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (183, 483, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (184, 484, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (185, 485, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (186, 486, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (187, 487, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (188, 488, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (189, 489, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (190, 490, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (191, 491, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (192, 492, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (193, 493, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (194, 494, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (195, 495, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (196, 496, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (197, 497, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (198, 498, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (199, 499, 5)
GO
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (200, 500, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (201, 501, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (202, 502, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (203, 503, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (204, 504, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (205, 505, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (206, 506, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (207, 507, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (208, 508, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (209, 509, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (210, 510, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (211, 511, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (212, 512, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (213, 513, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (214, 514, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (215, 515, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (216, 516, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (217, 517, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (218, 518, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (219, 519, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (220, 520, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (221, 521, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (222, 522, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (223, 523, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (224, 524, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (225, 525, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (226, 526, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (227, 527, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (228, 528, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (229, 529, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (230, 530, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (231, 531, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (232, 532, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (233, 533, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (234, 534, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (235, 535, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (236, 536, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (237, 537, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (238, 538, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (239, 539, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (240, 540, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (241, 541, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (242, 542, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (243, 543, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (244, 544, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (245, 545, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (246, 546, 3)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (247, 547, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (248, 548, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (249, 549, 4)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (250, 550, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (251, 551, 5)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (252, 552, 2)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (253, 553, 1)
INSERT [dbo].[PersonRole] ([ID], [personID], [roleID]) VALUES (254, 554, 2)
SET IDENTITY_INSERT [dbo].[PersonRole] OFF
SET IDENTITY_INSERT [dbo].[Presentation] ON 

INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (1, N'A dive into Data Quality Services', N'Intermediate', N'New York', NULL, NULL, 26, 401)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (2, N'A Dynamic World Demands Dynamic SQL', N'Intermediate', N'Kiyv', NULL, NULL, 22, 402)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (3, N'A Dynamic World Demands Dynamic SQL', N'Intermediate', N'Kiyv', NULL, NULL, 26, 403)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (4, N'Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)', N'Beginner', N'Budapest', NULL, NULL, 20, 404)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (5, N'AlwaysOn: Improve reliability and reporting performance with one cool tech', N'Beginner', N'New York', NULL, NULL, 26, 405)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (6, N'An introduction to Data Mining', N'Intermediate', N'Kiyv', NULL, NULL, 25, 406)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (7, N'An Introduction to Database Design', N'Beginner', N'New York', NULL, NULL, 23, 407)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (8, N'Autogenerating a process data warehouse', N'Advanced', N'New York', NULL, NULL, 26, 408)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (9, N'Automate your daily checklist with PBM and CMS', N'Intermediate', N'Budapest', NULL, NULL, 25, 409)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (10, N'Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', N'Intermediate', N'New York', NULL, NULL, 19, 410)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (11, N'Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', N'Intermediate', N'Kiev', NULL, NULL, 26, 411)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (12, N'Automating Execution Plan Analysis', N'Advanced', N'Kiev', NULL, NULL, 21, 412)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (13, N'Automating Execution Plan Analysis', N'Advanced', N'New York', NULL, NULL, 20, 413)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (14, N'Automating SQL Server using PowerShell', N'Intermediate', N'New York', NULL, NULL, 25, 414)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (15, N'Balanced Scorecards using SSRS', N'Intermediate', N'Budapest', NULL, NULL, 19, 415)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (16, N'Baselines and Performance Monitoring with PAL', N'Beginner', N'New York', NULL, NULL, 26, 416)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (17, N'Basic Database Design', N'Beginner', N'New York', NULL, NULL, 20, 417)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (18, N'Basic Database Programming', N'Beginner', N'Kiev', NULL, NULL, 23, 418)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (19, N'Become a BI Independent Consultant!', N'Beginner', N'Budapest', NULL, NULL, 20, 419)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (20, N'Becoming a Top DBA--Learning Automation in SQL Server', N'Beginner', N'Kiev', NULL, NULL, 23, 420)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (21, N'Best Practices Document', N'Intermediate', N'Kiev', NULL, NULL, 24, 421)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (22, N'Best Practices for Efficient SSRS Report Creation', N'Beginner', N'New York', NULL, NULL, 23, 422)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (23, N'Biggest Loser: Database Edition', N'Intermediate', N'New York', NULL, NULL, 19, 423)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (24, N'Building a BI Solution in the Cloud', N'Intermediate', N'Budapest', NULL, NULL, 23, 424)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (25, N'Building an Effective Data Warehouse Architecture', N'Beginner', N'New York', NULL, NULL, 24, 425)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (26, N'Building an Effective Data Warehouse Architecture with the cloud and MPP', N'Beginner', N'New York', NULL, NULL, 22, 426)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (27, N'Bulk load and minimal logged inserts', N'Advanced', N'New York', NULL, NULL, 25, 427)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (28, N'Business Analytics with SQL Server & Power Map:Everything you want to know but were afraid to ask', N'Intermediate', N'New York', NULL, NULL, 22, 428)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (29, N'Challenges to designing financial warehouses, lessons learnt', N'Intermediate', N'New York', NULL, NULL, 21, 429)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (30, N'Change Data Capture in SQL Server 2008/2012', N'Intermediate', N'New York', NULL, NULL, 21, 430)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (31, N'Changing Your Habits to Improve the Performance of Your T-SQL', N'Beginner', N'Kiev', NULL, NULL, 22, 431)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (32, N'Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments', N'Beginner', N'Kiev', NULL, NULL, 21, 432)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (33, N'Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments', N'Non-Technical', N'Kiev', NULL, NULL, 22, 433)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (34, N'Coffee Break', N'Non-Technical', N'Budapest', NULL, NULL, 21, 434)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (35, N'Creating A Performance Health Repository - using MDW', N'Beginner', N'Kiev', NULL, NULL, 25, 435)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (36, N'Creating efficient and effective SSRS BI Solutions', N'Intermediate', N'Kiev', NULL, NULL, 21, 436)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (37, N'Creating efficient and effective SSRS BI Solutions', N'Intermediate', N'New York', NULL, NULL, 25, 437)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (38, N'Data Partitioning', N'Intermediate', N'New York', NULL, NULL, 22, 438)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (39, N'Data Tier Application Testing with NUnit and Distributed Replay', N'Intermediate', N'New York', NULL, NULL, 20, 439)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (40, N'Database design for mere developers', N'Intermediate', N'Budapest', NULL, NULL, 21, 440)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (41, N'Database design for mere developers', N'Intermediate', N'New York', NULL, NULL, 19, 441)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (42, N'Database Design: Solving Problems Before they Start!', N'Beginner', N'New York', NULL, NULL, 20, 442)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (43, N'Database Modeling and Design', N'Intermediate', N'New York', NULL, NULL, 25, 443)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (44, N'Database Virtualization and Drinking out of the Fire Hose', N'Intermediate', N'New York', NULL, NULL, 26, 444)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (45, N'DAX and the tabular model', N'Intermediate', N'Kiev', NULL, NULL, 25, 445)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (46, N'DBA FOR DUMMIES', N'Beginner', N'Budapest', NULL, NULL, 22, 446)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (47, N'Dealing With Difficult People', N'Beginner', N'Kiev', NULL, NULL, 25, 447)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (48, N'Development Lifecycle with SQL Server Data Tools and DACFx', N'Intermediate', N'Kiev', NULL, NULL, 26, 448)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (49, N'Did You Vote Today? A DBAs Guide to Cluster Quorum', N'Advanced', N'Kiev', NULL, NULL, 25, 449)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (50, N'Dimensional Modeling Design Patterns: Beyond Basics', N'Intermediate', N'Kiev', NULL, NULL, 26, 450)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (51, N'Dimensional Modeling Design Patterns: Beyond Basics', N'Intermediate', N'Budapest', NULL, NULL, 25, 451)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (52, N'Diving Into Query Execution Plans', N'Intermediate', N'New York', NULL, NULL, 23, 452)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (53, N'Dynamic SQL: Writing Efficient Queries on the Fly', N'Beginner', N'Kiev', NULL, NULL, 20, 453)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (54, N'Easy Architecture Design for HA and DR', N'Intermediate', N'New York', NULL, NULL, 24, 454)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (55, N'Enhancing your career: Building your personal brand', N'Beginner', N'New York', NULL, NULL, 24, 455)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (56, N'Establishing a SLA', N'Intermediate', N'New York', NULL, NULL, 21, 456)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (57, N'ETL not ELT! Common mistakes and misconceptions about SSIS', N'Advanced', N'Budapest', NULL, NULL, 23, 457)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (58, N'Event Kickoff and Networking', N'Non-Technical', N'New York', NULL, NULL, 21, 458)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (59, N'Execution Plans: What Can You Do With Them?', N'Intermediate', N'New York', NULL, NULL, 22, 459)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (60, N'Faster, Better Decisions with Self Service Business Analytics', N'Intermediate', N'New York', NULL, NULL, 26, 460)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (61, N'Full Text Indexing Basics', N'Beginner', N'Budapest', NULL, NULL, 23, 461)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (62, N'Get your Mining Model Predictions out to all', N'Intermediate', N'New York', NULL, NULL, 21, 462)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (63, N'Getting a job with Microsoft', N'Non-Technical', N'New York', NULL, NULL, 24, 463)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (64, N'Graph Databases for SQL Server Professionals', N'Intermediate', N'New York', NULL, NULL, 22, 464)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (65, N'Hacking Exposé - Using SSL to Protect SQL Connections', N'Intermediate', N'New York', NULL, NULL, 19, 465)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (66, N'Hacking the SSIS 2012 Catalog', N'Beginner', N'Budapest', NULL, NULL, 26, 466)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (67, N'Hidden in plain sight: master your tools', N'Intermediate', N'New York', NULL, NULL, 22, 467)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (68, N'Highly Available SQL Server in Windows Azure IaaS', N'Intermediate', N'New York', NULL, NULL, 22, 468)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (69, N'How to Make a LOT More Money as a Consultant', N'Beginner', N'New York', NULL, NULL, 21, 469)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (70, N'How to Think Like the Engine', N'Intermediate', N'New York', NULL, NULL, 23, 470)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (71, N'Hybrid Cloud Scenarios with SQL Server 2014', N'Intermediate', N'Budapest', NULL, NULL, 26, 471)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (72, N'Hybrid Solutions: The Future of SQL Server Disaster Recovery', N'Intermediate', N'Budapest', NULL, NULL, 26, 472)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (73, N'Implementing Data Warehouse Patterns with the Microsoft BI Tools', N'Intermediate', N'Budapest', NULL, NULL, 26, 473)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (74, N'Inroduction to Triggers', N'Beginner', N'Budapest', NULL, NULL, 20, 474)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (75, N'Integrating Reporting Services with SharePoint', N'Intermediate', N'New York', NULL, NULL, 22, 475)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (76, N'Integration Services (SSIS) for the DBA', N'Intermediate', N'New York', NULL, NULL, 20, 476)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (77, N'Introducing Power BI', N'Beginner', N'New York', NULL, NULL, 20, 477)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (78, N'Introduction to Database Recovery', N'Beginner', N'New York', NULL, NULL, 23, 478)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (79, N'Introduction to High Availability with SQL Server', N'Beginner', N'New York', NULL, NULL, 25, 479)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (80, N'Introduction to Powershell for DBA''s', N'Beginner', N'New York', NULL, NULL, 24, 480)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (81, N'Introduction to SQL Server - Part 1', N'Beginner', N'New York', NULL, NULL, 20, 481)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (82, N'Introduction to SQL Server - Part 2', N'Beginner', N'New York', NULL, NULL, 24, 482)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (83, N'Is That A Failover Cluster On Your Laptop/Desktop?', N'Intermediate', N'New York', NULL, NULL, 25, 483)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (84, N'Leaving the Windows Open', N'Intermediate', N'New York', NULL, NULL, 25, 484)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (85, N'Lunch Break', N'Non-Technical', N'New York', NULL, NULL, 20, 485)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (86, N'Lunchtime Keynote', N'Non-Technical', N'New York', NULL, NULL, 23, 486)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (87, N'Master Data Services Best Practices', N'Intermediate', N'New York', NULL, NULL, 26, 487)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (88, N'Master Data Services Disaster Recovery', N'Intermediate', N'New York', NULL, NULL, 19, 488)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (89, N'Mind your language!! Cursors are a dirty word', N'Intermediate', N'New York', NULL, NULL, 23, 489)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (90, N'Modern Data Warehousing', N'Beginner', N'New York', NULL, NULL, 20, 490)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (91, N'Monitoring Server health via Reporting Services dashboards', N'Intermediate', N'New York', NULL, NULL, 21, 491)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (92, N'Monitoring SQL Server using Extended Events', N'Beginner', N'New York', NULL, NULL, 21, 492)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (93, N'Multidimensional vs Tabular - May the Best Model Win', N'Intermediate', N'New York', NULL, NULL, 21, 493)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (94, N'Murder They Wrote', N'Intermediate', N'New York', NULL, NULL, 20, 494)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (95, N'Never Have to Say "Mayday!!!" Again', N'Beginner', N'New York', NULL, NULL, 25, 495)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (96, N'Now you see it! Now you don’t! Conjuring many reports utilizing only one SSRS report.', N'Intermediate', N'New York', NULL, NULL, 19, 496)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (97, N'Optimal Infrastructure Strategies for Cisco UCS, Nexus and SQL Server', N'Non-Technical', N'Budapest', NULL, NULL, 22, 497)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (98, N'Optimizing Protected Indexes', N'Intermediate', N'Budapest', NULL, NULL, 21, 498)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (99, N'Partitioning as a design pattern', N'Advanced', N'Budapest', NULL, NULL, 20, 499)
GO
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (100, N'Power BI Components in Microsoft''s Self-Service BI Suite', N'Beginner', N'New York', NULL, NULL, 23, 500)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (101, N'Power to the people!!', N'Intermediate', N'Kiyv', NULL, NULL, 23, 501)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (102, N'PowerShell Basics for SQLServer', N'Beginner', N'Kiyv', NULL, NULL, 25, 502)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (103, N'PowerShell for the Reluctant DBA / Developer', N'Beginner', N'Kiyv', NULL, NULL, 23, 503)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (104, N'Prevent Recovery Amnesia – Forget the Backups', N'Beginner', N'Kiyv', NULL, NULL, 25, 504)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (105, N'Query Optimization Crash Course', N'Beginner', N'Kiyv', NULL, NULL, 22, 505)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (106, N'Raffle', N'Non-Technical', N'', NULL, NULL, 21, 506)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (107, N'Rapid Application Development with Master Data Services', N'Intermediate', N'Kiyv', NULL, NULL, 20, 507)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (108, N'Recovery and Backup for Beginners', N'Beginner', N'Kiyv', NULL, NULL, 21, 508)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (109, N'Reduce, Reuse, Recycle: Automating Your BI Framework', N'Intermediate', N'Kiyv', NULL, NULL, 20, 509)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (110, N'Registrations', N'Non-Technical', N'', NULL, NULL, 19, 510)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (111, N'Replicaton Technologies', N'Advanced', N'Kiyv', NULL, NULL, 22, 511)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (112, N'Reporting Services for Mere DBAs', N'Intermediate', N'Kiyv', NULL, NULL, 26, 512)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (113, N'Scaling with SQL Server Service Broker', N'Advanced', N'Kiyv', NULL, NULL, 22, 513)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (114, N'Scaling with SQL Server Service Broker', N'Advanced', N'Kiyv', NULL, NULL, 21, 514)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (115, N'Self-Service Data Integration with Power Query', N'Beginner', N'Kiyv', NULL, NULL, 23, 515)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (116, N'Shortcuts to Building SSIS in .Net', N'Beginner', N'Kiyv', NULL, NULL, 22, 516)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (117, N'So You Want To Be A Consultant?', N'Beginner', N'Kiyv', NULL, NULL, 23, 517)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (118, N'SQL anti patterns', N'Advanced', N'Kiyv', NULL, NULL, 26, 518)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (119, N'SQL Server 2012/2014 Columnstore index', N'Intermediate', N'Kiyv', NULL, NULL, 23, 519)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (120, N'SQL Server 2012/2014 Performance Tuning All Up', N'Intermediate', N'Kiyv', NULL, NULL, 23, 520)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (121, N'SQL Server 2014 Data Access Layers', N'Intermediate', N'Kiyv', NULL, NULL, 24, 521)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (122, N'SQL Server 2014 New Features', N'Intermediate', N'Kiyv', NULL, NULL, 19, 522)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (123, N'SQL Server AlwaysOn Availability Groups', N'Beginner', N'Kiyv', NULL, NULL, 24, 523)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (124, N'SQL Server and the Cloud', N'Beginner', N'Kiyv', NULL, NULL, 22, 524)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (125, N'SQL Server Compression and what it can do for you', N'Advanced', N'Kiyv', NULL, NULL, 19, 525)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (126, N'SQL Server Reporting Services 2014 on Steroids!!', N'Intermediate', N'Kiyv', NULL, NULL, 26, 526)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (127, N'SQL Server Reporting Services Best Practices', N'Intermediate', N'Kiyv', NULL, NULL, 25, 527)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (128, N'SQL Server Reporting Services, attendees choose', N'Intermediate', N'Kiyv', NULL, NULL, 23, 528)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (129, N'SQL Server Storage Engine under the hood', N'Intermediate', N'Kiyv', NULL, NULL, 19, 529)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (130, N'SQL Server Storage internals: Looking under the hood.', N'Advanced', N'Kiyv', NULL, NULL, 24, 530)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (131, N'SSIS 2014 Data Flow Tuning Tips and Tricks', N'Beginner', N'Kiyv', NULL, NULL, 21, 531)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (132, N'Standalone to High-Availability Clusters over Lunch—with Time to Spare', N'Intermediate', N'Budapest', NULL, NULL, 20, 532)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (133, N'Stress testing SQL Server', N'Advanced', N'Kiyv', NULL, NULL, 25, 533)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (134, N'Table partitioning for Azure SQL Databases', N'Beginner', N'Kiyv', NULL, NULL, 21, 534)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (135, N'Testing', N'Beginner', N'Kiyv', NULL, NULL, 24, 535)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (136, N'The future of the data professional', N'Beginner', N'Kiyv', NULL, NULL, 22, 536)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (137, N'The Quest for the Golden Record:MDM Best Practices', N'Beginner', N'Budapest', NULL, NULL, 20, 537)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (138, N'The Quest to Find Bad Data With Data Profiling', N'Intermediate', N'Budapest', NULL, NULL, 25, 538)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (139, N'The Spy Who Loathed Me - An Intro to SQL Security', N'Beginner', N'Budapest', NULL, NULL, 21, 539)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (140, N'Tired of the CRUD? Automate it!', N'Intermediate', N'Budapest', NULL, NULL, 25, 540)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (141, N'Top 5 Ways to Improve Your triggers', N'Intermediate', N'Budapest', NULL, NULL, 21, 541)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (142, N'Tricks that have saved my bacon', N'Beginner', N'Budapest', NULL, NULL, 20, 542)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (143, N'T-SQL : Bad Habits & Best Practices', N'Beginner', N'Budapest', NULL, NULL, 25, 543)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (144, N'T-SQL for Application Developers - Attendees chose', N'Intermediate', N'Budapest', NULL, NULL, 23, 544)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (145, N'Tune Queries By Fixing Bad Parameter Sniffing', N'Intermediate', N'Budapest', NULL, NULL, 24, 545)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (146, N'Using Extended Events in SQL Server', N'Advanced', N'Budapest', NULL, NULL, 19, 546)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (147, N'Watch Brent Tune Queries', N'Intermediate', N'Budapest', NULL, NULL, 19, 547)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (148, N'What every SQL Server DBA needs to know about Windows Server 10 Technical Preview', N'Intermediate', N'Budapest', NULL, NULL, 20, 548)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (149, N'What exactly is big data and why should I care?', N'Beginner', N'Budapest', NULL, NULL, 22, 549)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (150, N'What is it like to work for Microsoft?', N'Beginner', N'Budapest', NULL, NULL, 20, 550)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (151, N'What’s new in SQL Server Integration Services 2012', N'Intermediate', N'Budapest', NULL, NULL, 21, 551)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (152, N'Why do we shun using tools for DBA job?', N'Intermediate', N'Budapest', NULL, NULL, 20, 552)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (153, N'Why OLAP? Building SSAS cubes and benefits of OLAP', N'Intermediate', N'Budapest', NULL, NULL, 22, 553)
INSERT [dbo].[Presentation] ([ID], [title], [level], [event], [eventID], [roomID], [trackID], [speakerID]) VALUES (154, N'You''re Doing It Wrong!!', N'Intermediate', N'Budapest', NULL, NULL, 23, 554)
SET IDENTITY_INSERT [dbo].[Presentation] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [title]) VALUES (1, N'Presenter')
INSERT [dbo].[Role] ([ID], [title]) VALUES (2, N'Attendee')
INSERT [dbo].[Role] ([ID], [title]) VALUES (3, N'Organizer')
INSERT [dbo].[Role] ([ID], [title]) VALUES (4, N'Volunteer')
INSERT [dbo].[Role] ([ID], [title]) VALUES (5, N'Sponsor')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Sponsor] ON 

INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (1, N'VMWare', N'Platinum Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (2, N'Verizon Digital Media Services', N'Platinum Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (3, N'Microsoft Corporation (GAP) (GAP Sponsor)', N'Platinum Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (4, N'Tintri', N'Platinum Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (5, N'Amazon Web Services, LLC', N'Gold Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (6, N'Pyramid Analytics (GAP Sponsor)', N'Gold Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (7, N'Pure Storage', N'Gold Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (8, N'Profisee', N'Gold Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (9, N'NetLib Security', N'Silver Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (10, N'Melissa Data Corp.', N'Silver Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (11, N'Red Gate Software', N'Silver Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (12, N'SentryOne', N'Silver Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (13, N'Hush Hush', N'Bronze Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (14, N'COZYROC', N'Bronze Sponsor')
INSERT [dbo].[Sponsor] ([ID], [name], [tier]) VALUES (15, N'SQLDocKit by Acceleratio Ltd.', N'Bronze Sponsor')
SET IDENTITY_INSERT [dbo].[Sponsor] OFF
SET IDENTITY_INSERT [dbo].[Track] ON 

INSERT [dbo].[Track] ([ID], [name]) VALUES (19, N'Analytics and Visualization')
INSERT [dbo].[Track] ([ID], [name]) VALUES (20, N'Application & Database Development')
INSERT [dbo].[Track] ([ID], [name]) VALUES (21, N'BI Information Delivery')
INSERT [dbo].[Track] ([ID], [name]) VALUES (22, N'BI Platform Architecture, Development & Administration')
INSERT [dbo].[Track] ([ID], [name]) VALUES (15, N'BI/BA')
INSERT [dbo].[Track] ([ID], [name]) VALUES (12, N'Business Intelligence')
INSERT [dbo].[Track] ([ID], [name]) VALUES (16, N'Cloud')
INSERT [dbo].[Track] ([ID], [name]) VALUES (23, N'Cloud Application Development & Deployment')
INSERT [dbo].[Track] ([ID], [name]) VALUES (13, N'DBA')
INSERT [dbo].[Track] ([ID], [name]) VALUES (17, N'Developer')
INSERT [dbo].[Track] ([ID], [name]) VALUES (14, N'DevOps')
INSERT [dbo].[Track] ([ID], [name]) VALUES (18, N'Enterprise')
INSERT [dbo].[Track] ([ID], [name]) VALUES (24, N'Enterprise Database Administration & Deployment')
INSERT [dbo].[Track] ([ID], [name]) VALUES (27, N'Other')
INSERT [dbo].[Track] ([ID], [name]) VALUES (25, N'Professional Development')
INSERT [dbo].[Track] ([ID], [name]) VALUES (26, N'Strategy and Architecture
')
SET IDENTITY_INSERT [dbo].[Track] OFF
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Class__Title__286302EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Class] ADD  DEFAULT ('Unnamed Class') FOR [title]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Class_duration_default]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Class] ADD  CONSTRAINT [Class_duration_default]  DEFAULT ((60)) FOR [duration]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Class_Presentation_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Class]'))
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [Class_Presentation_ID_fk] FOREIGN KEY([presentationID])
REFERENCES [dbo].[Presentation] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Class_Presentation_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Class]'))
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [Class_Presentation_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Event_Venue_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event]'))
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [Event_Venue_ID_fk] FOREIGN KEY([venueID])
REFERENCES [dbo].[Venue] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Event_Venue_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event]'))
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [Event_Venue_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EventSponsor_Event_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSponsor]'))
ALTER TABLE [dbo].[EventSponsor]  WITH CHECK ADD  CONSTRAINT [EventSponsor_Event_ID_fk] FOREIGN KEY([eventID])
REFERENCES [dbo].[Event] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EventSponsor_Event_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSponsor]'))
ALTER TABLE [dbo].[EventSponsor] CHECK CONSTRAINT [EventSponsor_Event_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EventSponsor_Sponsor_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSponsor]'))
ALTER TABLE [dbo].[EventSponsor]  WITH CHECK ADD  CONSTRAINT [EventSponsor_Sponsor_ID_fk] FOREIGN KEY([sponsorID])
REFERENCES [dbo].[Sponsor] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EventSponsor_Sponsor_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSponsor]'))
ALTER TABLE [dbo].[EventSponsor] CHECK CONSTRAINT [EventSponsor_Sponsor_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonAddress_Address_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonAddress]'))
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [PersonAddress_Address_ID_fk] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonAddress_Address_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonAddress]'))
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [PersonAddress_Address_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonAddress_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonAddress]'))
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [PersonAddress_Person_ID_fk] FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonAddress_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonAddress]'))
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [PersonAddress_Person_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonEmail_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonEmail]'))
ALTER TABLE [dbo].[PersonEmail]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmail_Person] FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonEmail_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonEmail]'))
ALTER TABLE [dbo].[PersonEmail] CHECK CONSTRAINT [FK_PersonEmail_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonEmail_Email_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonEmail]'))
ALTER TABLE [dbo].[PersonEmail]  WITH CHECK ADD  CONSTRAINT [PersonEmail_Email_ID_fk] FOREIGN KEY([emailID])
REFERENCES [dbo].[Email] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonEmail_Email_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonEmail]'))
ALTER TABLE [dbo].[PersonEmail] CHECK CONSTRAINT [PersonEmail_Email_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonEvent_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonPresentation]'))
ALTER TABLE [dbo].[PersonPresentation]  WITH CHECK ADD  CONSTRAINT [PersonEvent_Person_ID_fk] FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonEvent_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonPresentation]'))
ALTER TABLE [dbo].[PersonPresentation] CHECK CONSTRAINT [PersonEvent_Person_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonPresentation_Presentation_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonPresentation]'))
ALTER TABLE [dbo].[PersonPresentation]  WITH CHECK ADD  CONSTRAINT [PersonPresentation_Presentation_ID_fk] FOREIGN KEY([presentationID])
REFERENCES [dbo].[Presentation] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonPresentation_Presentation_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonPresentation]'))
ALTER TABLE [dbo].[PersonPresentation] CHECK CONSTRAINT [PersonPresentation_Presentation_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonRole_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonRole]'))
ALTER TABLE [dbo].[PersonRole]  WITH CHECK ADD  CONSTRAINT [PersonRole_Person_ID_fk] FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonRole_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonRole]'))
ALTER TABLE [dbo].[PersonRole] CHECK CONSTRAINT [PersonRole_Person_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonRole_Role_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonRole]'))
ALTER TABLE [dbo].[PersonRole]  WITH CHECK ADD  CONSTRAINT [PersonRole_Role_ID_fk] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PersonRole_Role_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonRole]'))
ALTER TABLE [dbo].[PersonRole] CHECK CONSTRAINT [PersonRole_Role_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Event_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [Presentation_Event_ID_fk] FOREIGN KEY([eventID])
REFERENCES [dbo].[Event] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Event_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [Presentation_Event_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [Presentation_Person_ID_fk] FOREIGN KEY([speakerID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [Presentation_Person_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Room_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [Presentation_Room_ID_fk] FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Room_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [Presentation_Room_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Track_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [Presentation_Track_ID_fk] FOREIGN KEY([trackID])
REFERENCES [dbo].[Track] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Presentation_Track_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Presentation]'))
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [Presentation_Track_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PresentationProposal_Event_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PresentationProposal]'))
ALTER TABLE [dbo].[PresentationProposal]  WITH CHECK ADD  CONSTRAINT [PresentationProposal_Event_ID_fk] FOREIGN KEY([eventID])
REFERENCES [dbo].[Event] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PresentationProposal_Event_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PresentationProposal]'))
ALTER TABLE [dbo].[PresentationProposal] CHECK CONSTRAINT [PresentationProposal_Event_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PresentationProposal_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PresentationProposal]'))
ALTER TABLE [dbo].[PresentationProposal]  WITH CHECK ADD  CONSTRAINT [PresentationProposal_Person_ID_fk] FOREIGN KEY([speakerID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PresentationProposal_Person_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[PresentationProposal]'))
ALTER TABLE [dbo].[PresentationProposal] CHECK CONSTRAINT [PresentationProposal_Person_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Room_Venue_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room]'))
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [Room_Venue_ID_fk] FOREIGN KEY([venueID])
REFERENCES [dbo].[Venue] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Room_Venue_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room]'))
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [Room_Venue_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_Presentation_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Schedule]'))
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Schedule_Presentation_ID_fk] FOREIGN KEY([presentationID])
REFERENCES [dbo].[Presentation] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_Presentation_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Schedule]'))
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Schedule_Presentation_ID_fk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Venue_Address_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venue]'))
ALTER TABLE [dbo].[Venue]  WITH CHECK ADD  CONSTRAINT [Venue_Address_ID_fk] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Venue_Address_ID_fk]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venue]'))
ALTER TABLE [dbo].[Venue] CHECK CONSTRAINT [Venue_Address_ID_fk]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertPresentation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[insertPresentation] AS' 
END
GO
ALTER PROCEDURE [dbo].[insertPresentation]
  @speaker  VARCHAR(90) = NULL  ,
  @pres_title VARCHAR(145) = NULL
  AS

  BEGIN
    --If given person is not in the Person table, add the person
    IF NOT EXISTS (SELECT firstName, lastName FROM Person
    WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
      BEGIN
        INSERT INTO Person
          VALUES (SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1), REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
        --If person and presentation do not exist add both
        IF NOT EXISTS (SELECT title FROM Presentation WHERE title = @pres_title)
       BEGIN
         INSERT INTO Presentation(title, speakerID)
           VALUES (@pres_title, (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1))))
         END
        END
      --Otherwise just add the speaker ID
      ELSE
        BEGIN
          UPDATE Presentation
        SET speakerID = (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
      WHERE title = @pres_title
        END
    END
  --Now if the person does exist, check and add the presentation if not present
  IF NOT EXISTS (SELECT title FROM Presentation
     WHERE title = @pres_title)
       BEGIN
         INSERT INTO Presentation(title, speakerID)
           VALUES (@pres_title, (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1))))
         END
    ELSE BEGIN
      UPDATE Presentation
        SET speakerID = (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
      WHERE title = @pres_title
      END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertPresentation2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[insertPresentation2] AS' 
END
GO
ALTER PROCEDURE [dbo].[insertPresentation2]
  @speaker  VARCHAR(90) = NULL  ,
  @pres_title VARCHAR(145) = NULL
  AS

  BEGIN
    --If given person is not in the Person table, add the person
    IF NOT EXISTS (SELECT firstName, lastName FROM Person
    WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
      BEGIN
        INSERT INTO Person
          VALUES (SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1), REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
        --If person and presentation do not exist add both
        IF NOT EXISTS (SELECT title FROM Presentation WHERE title = @pres_title)
       BEGIN
         INSERT INTO Presentation(title, speakerID)
           VALUES (@pres_title, (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1))))
         END
        END
      --Otherwise just add the speaker ID
      ELSE
        BEGIN
          UPDATE Presentation
        SET speakerID = (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
      WHERE title = @pres_title
        END
    END
  --Now if the person does exist, check and add the presentation if not present
  IF NOT EXISTS (SELECT title FROM Presentation
     WHERE title = @pres_title)
       BEGIN
         INSERT INTO Presentation(title, speakerID)
           VALUES (@pres_title, (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1))))
         END
    ELSE BEGIN
      UPDATE Presentation
        SET speakerID = (SELECT ID FROM Person
           WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
      WHERE title = @pres_title
      END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_presentationsPerTrack]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_presentationsPerTrack] AS' 
END
GO
ALTER PROC [dbo].[sp_presentationsPerTrack]
  @name VARCHAR(255)
AS
  BEGIN TRY
  SELECT event, Track.name as track, title as presentation, level From Presentation
    INNER JOIN Track ON Presentation.trackID = Track.ID
  WHERE event = 'Budapest' AND name = @name
  END TRY
  BEGIN CATCH
      ROLLBACK TRANSACTION;

    DECLARE @ErrorNumber INT = ERROR_NUMBER();
    DECLARE @ErrorLine INT = ERROR_LINE();
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();

    PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
    PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_randomeventsponsor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_randomeventsponsor] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_randomeventsponsor]
@X INT = 1
AS
  BEGIN
    BEGIN TRY
    WHILE @X < 25
    INSERT INTO EventSponsor(eventID, sponsorID)
    VALUES (floor(rand() * (8 - 1 + 1)) + 1, floor(rand() * (15 - 1 + 1)) + 1)
    SET @X += 1
    END TRY
    BEGIN CATCH
    PRINT ('Could Not assign random events to random sponsors.')
    END CATCH
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_selectPresentation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_selectPresentation] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_selectPresentation]
  AS
SELECT DISTINCT
title, level, event, firstName +' ' + lastName as Speaker
FROM
Presentation
INNER JOIN Person ON Presentation.speakerID = Person.ID
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertPresentationOld]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[insertPresentationOld] AS' 
END
GO
ALTER PROCEDURE [dbo].[insertPresentationOld]
  @speaker  VARCHAR(90)  ,
  @presentation VARCHAR(145)
  AS
      BEGIN
        IF NOT EXISTS(SELECT Presentation.title FROM Presentation)
          BEGIN
          INSERT INTO dbo.Presentation
            (title)
          VALUES
            (@presentation)
            END
        IF NOT EXISTS (SELECT Person.ID From Person
        WHERE firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
          AND lastName = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
          BEGIN
            INSERT INTO dbo.Person
            (firstName, lastName)
            VALUES
              (SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1), REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1)))
          END
        END
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', N'COLUMN',N'title'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Official name of class.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', N'COLUMN',N'description'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Class description up to 250 characters in length.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'description'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', N'COLUMN',N'duration'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Duration in minutes. Check in place to make sure value is positive.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'duration'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Class', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'“Class” is a content that presenter presents. It has a title, a description, a duration, and a difficulty level.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Room', N'COLUMN',N'roomName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of specific room' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'roomName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Room', N'COLUMN',N'location'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relative location of the room' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'location'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Schedule', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Since each presentation that is approved is assigned a track, the presentation ID is all that is required to pupulate a Schedule table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule'
GO
