USE [master]
GO
/****** Object:  Database [JeanCraft]    Script Date: 2024/05/14 10:57:56 ******/
CREATE DATABASE [JeanCraft]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JeanCraft', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\JeanCraft.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JeanCraft_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\JeanCraft_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [JeanCraft] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JeanCraft].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JeanCraft] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JeanCraft] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JeanCraft] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JeanCraft] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JeanCraft] SET ARITHABORT OFF 
GO
ALTER DATABASE [JeanCraft] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JeanCraft] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JeanCraft] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JeanCraft] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JeanCraft] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JeanCraft] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JeanCraft] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JeanCraft] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JeanCraft] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JeanCraft] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JeanCraft] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JeanCraft] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JeanCraft] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JeanCraft] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JeanCraft] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JeanCraft] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JeanCraft] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JeanCraft] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JeanCraft] SET  MULTI_USER 
GO
ALTER DATABASE [JeanCraft] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JeanCraft] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JeanCraft] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JeanCraft] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JeanCraft] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JeanCraft] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [JeanCraft] SET QUERY_STORE = ON
GO
ALTER DATABASE [JeanCraft] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JeanCraft]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[UserID] [nchar](10) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[Image] [nvarchar](1000) NULL,
	[Status] [bit] NULL,
	[RoleId] [nchar](10) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [nchar](10) NOT NULL,
	[UserID] [nchar](10) NULL,
	[Type] [nchar](50) NULL,
	[Detail] [nchar](1000) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[ProductID] [nchar](10) NOT NULL,
	[Id] [nchar](10) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Components]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Components](
	[ComponentID] [nchar](10) NOT NULL,
	[Description] [nvarchar](30) NULL,
	[Image] [nchar](1000) NULL,
	[Prize] [float] NULL,
	[Type] [nchar](10) NULL,
 CONSTRAINT [PK_Components] PRIMARY KEY CLUSTERED 
(
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentTypes]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentTypes](
	[TypeID] [nchar](10) NOT NULL,
	[Description] [nvarchar](30) NULL,
 CONSTRAINT [PK_ComponentTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignOne]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignOne](
	[DesignOneID] [nchar](10) NOT NULL,
	[Fit] [nchar](10) NULL,
	[Length] [nchar](10) NULL,
	[Cuffs] [nchar](10) NULL,
	[Fly] [nchar](10) NULL,
	[FrontPocket] [nchar](10) NULL,
	[BackPocket] [nchar](10) NULL,
 CONSTRAINT [PK_DesignOne] PRIMARY KEY CLUSTERED 
(
	[DesignOneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignThree]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignThree](
	[DesignThreeID] [nchar](10) NOT NULL,
	[MonoGram] [nchar](10) NULL,
	[Characters] [nvarchar](10) NULL,
	[EmbroideryFont] [nchar](10) NULL,
	[EmbroideryColor] [nchar](10) NULL,
	[StitchingThreadColor] [nchar](10) NULL,
	[ButtonAndRivet] [nchar](10) NULL,
	[BranchBackPatch] [nchar](10) NULL,
 CONSTRAINT [PK_DesignThree] PRIMARY KEY CLUSTERED 
(
	[DesignThreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignTwo]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignTwo](
	[DesignTwoID] [nchar](10) NOT NULL,
	[Finishing] [nchar](10) NULL,
	[FabricColor] [nchar](10) NULL,
 CONSTRAINT [PK_DesignTwo] PRIMARY KEY CLUSTERED 
(
	[DesignTwoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [nchar](10) NOT NULL,
	[ProductID] [nchar](10) NOT NULL,
	[PriceUnit] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [nchar](10) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[AddressID] [nchar](10) NULL,
	[CartCost] [float] NULL,
	[ShippingCost] [float] NULL,
	[Note] [nvarchar](1000) NULL,
	[UserID] [nchar](10) NULL,
	[TotalCost] [nvarchar](100) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [nchar](10) NOT NULL,
	[OrderID] [nchar](10) NULL,
	[Amount] [float] NULL,
	[Method] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInventory]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventory](
	[ProductInventoryId] [nchar](10) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[ProductInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nchar](10) NOT NULL,
	[Image] [nvarchar](1000) NULL,
	[DesignOneID] [nchar](10) NULL,
	[DesignTwoID] [nchar](10) NULL,
	[DesignThreeID] [nchar](10) NULL,
	[Price] [float] NULL,
	[Size] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nchar](10) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 2024/05/14 10:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [nchar](10) NOT NULL,
	[UserID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Accounts] FOREIGN KEY([UserID])
REFERENCES [dbo].[Accounts] ([UserID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Accounts]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Components]  WITH CHECK ADD  CONSTRAINT [FK_Components_ComponentTypes] FOREIGN KEY([Type])
REFERENCES [dbo].[ComponentTypes] ([TypeID])
GO
ALTER TABLE [dbo].[Components] CHECK CONSTRAINT [FK_Components_ComponentTypes]
GO
ALTER TABLE [dbo].[DesignOne]  WITH CHECK ADD  CONSTRAINT [FK_DesignOne_Components] FOREIGN KEY([BackPocket])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignOne] CHECK CONSTRAINT [FK_DesignOne_Components]
GO
ALTER TABLE [dbo].[DesignOne]  WITH CHECK ADD  CONSTRAINT [FK_DesignOne_Components1] FOREIGN KEY([Cuffs])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignOne] CHECK CONSTRAINT [FK_DesignOne_Components1]
GO
ALTER TABLE [dbo].[DesignOne]  WITH CHECK ADD  CONSTRAINT [FK_DesignOne_Components2] FOREIGN KEY([Fit])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignOne] CHECK CONSTRAINT [FK_DesignOne_Components2]
GO
ALTER TABLE [dbo].[DesignOne]  WITH CHECK ADD  CONSTRAINT [FK_DesignOne_Components3] FOREIGN KEY([Fly])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignOne] CHECK CONSTRAINT [FK_DesignOne_Components3]
GO
ALTER TABLE [dbo].[DesignOne]  WITH CHECK ADD  CONSTRAINT [FK_DesignOne_Components5] FOREIGN KEY([FrontPocket])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignOne] CHECK CONSTRAINT [FK_DesignOne_Components5]
GO
ALTER TABLE [dbo].[DesignOne]  WITH CHECK ADD  CONSTRAINT [FK_DesignOne_Components6] FOREIGN KEY([Length])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignOne] CHECK CONSTRAINT [FK_DesignOne_Components6]
GO
ALTER TABLE [dbo].[DesignThree]  WITH CHECK ADD  CONSTRAINT [FK_DesignThree_Components] FOREIGN KEY([BranchBackPatch])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignThree] CHECK CONSTRAINT [FK_DesignThree_Components]
GO
ALTER TABLE [dbo].[DesignThree]  WITH CHECK ADD  CONSTRAINT [FK_DesignThree_Components1] FOREIGN KEY([ButtonAndRivet])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignThree] CHECK CONSTRAINT [FK_DesignThree_Components1]
GO
ALTER TABLE [dbo].[DesignThree]  WITH CHECK ADD  CONSTRAINT [FK_DesignThree_Components2] FOREIGN KEY([EmbroideryColor])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignThree] CHECK CONSTRAINT [FK_DesignThree_Components2]
GO
ALTER TABLE [dbo].[DesignThree]  WITH CHECK ADD  CONSTRAINT [FK_DesignThree_Components3] FOREIGN KEY([EmbroideryFont])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignThree] CHECK CONSTRAINT [FK_DesignThree_Components3]
GO
ALTER TABLE [dbo].[DesignThree]  WITH CHECK ADD  CONSTRAINT [FK_DesignThree_Components4] FOREIGN KEY([MonoGram])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignThree] CHECK CONSTRAINT [FK_DesignThree_Components4]
GO
ALTER TABLE [dbo].[DesignThree]  WITH CHECK ADD  CONSTRAINT [FK_DesignThree_Components5] FOREIGN KEY([StitchingThreadColor])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignThree] CHECK CONSTRAINT [FK_DesignThree_Components5]
GO
ALTER TABLE [dbo].[DesignTwo]  WITH CHECK ADD  CONSTRAINT [FK_DesignTwo_Components] FOREIGN KEY([Finishing])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignTwo] CHECK CONSTRAINT [FK_DesignTwo_Components]
GO
ALTER TABLE [dbo].[DesignTwo]  WITH CHECK ADD  CONSTRAINT [FK_DesignTwo_Components1] FOREIGN KEY([FabricColor])
REFERENCES [dbo].[Components] ([ComponentID])
GO
ALTER TABLE [dbo].[DesignTwo] CHECK CONSTRAINT [FK_DesignTwo_Components1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([UserID])
REFERENCES [dbo].[Accounts] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Address]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_Products] FOREIGN KEY([ProductInventoryId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_DesignOne] FOREIGN KEY([DesignOneID])
REFERENCES [dbo].[DesignOne] ([DesignOneID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_DesignOne]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_DesignThree] FOREIGN KEY([DesignThreeID])
REFERENCES [dbo].[DesignThree] ([DesignThreeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_DesignThree]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_DesignTwo] FOREIGN KEY([DesignTwoID])
REFERENCES [dbo].[DesignTwo] ([DesignTwoID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_DesignTwo]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Accounts] FOREIGN KEY([UserID])
REFERENCES [dbo].[Accounts] ([UserID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Accounts]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_CartItems] FOREIGN KEY([CartID])
REFERENCES [dbo].[CartItems] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_CartItems]
GO
USE [master]
GO
ALTER DATABASE [JeanCraft] SET  READ_WRITE 
GO
