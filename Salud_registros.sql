USE [master]
GO
/****** Object:  Database [dsrp_registro_salud]    Script Date: 25/08/2024 20:46:29 ******/
CREATE DATABASE [dsrp_registro_salud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dsrp_registro_salud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dsrp_registro_salud.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dsrp_registro_salud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dsrp_registro_salud_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dsrp_registro_salud] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dsrp_registro_salud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ARITHABORT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dsrp_registro_salud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dsrp_registro_salud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dsrp_registro_salud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dsrp_registro_salud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET RECOVERY FULL 
GO
ALTER DATABASE [dsrp_registro_salud] SET  MULTI_USER 
GO
ALTER DATABASE [dsrp_registro_salud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dsrp_registro_salud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dsrp_registro_salud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dsrp_registro_salud] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dsrp_registro_salud] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dsrp_registro_salud] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dsrp_registro_salud', N'ON'
GO
ALTER DATABASE [dsrp_registro_salud] SET QUERY_STORE = OFF
GO
USE [dsrp_registro_salud]
GO
/****** Object:  Table [dbo].[CENTRO_SALUD]    Script Date: 25/08/2024 20:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CENTRO_SALUD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](20) NOT NULL,
	[DIRECCIÓN] [varchar](100) NOT NULL,
	[TELEFONO] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VISITA]    Script Date: 25/08/2024 20:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VISITA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PACIENTE] [int] NOT NULL,
	[VISITA_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTE]    Script Date: 25/08/2024 20:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](20) NOT NULL,
	[nombre] [varchar](225) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[correo] [varchar](100) NULL,
	[estado_civil] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGISTRO_SALUD]    Script Date: 25/08/2024 20:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGISTRO_SALUD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIPO_REGISTRO_ID] [int] NOT NULL,
	[VISITA] [int] NOT NULL,
	[ID_PACIENTE] [int] NOT NULL,
	[SUCURSALES_ID] [int] NOT NULL,
	[RESULTADO] [varchar](100) NULL,
	[PRESIÓN_ARTERIAL] [varchar](1) NOT NULL,
	[FRECUENCIA] [varchar](100) NOT NULL,
	[PESO] [varchar](100) NOT NULL,
	[TRATAMIENTO] [varchar](250) NULL,
	[CREATED_AT] [datetime] NOT NULL,
	[UPDATED_AT] [datetime] NULL,
	[DELETED_AT] [datetime] NULL,
	[CREATED_BY] [int] NOT NULL,
	[UPDATED_BY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_REGISTRO]    Script Date: 25/08/2024 20:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_REGISTRO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](20) NOT NULL,
	[DETALLE] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_VISITA]    Script Date: 25/08/2024 20:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_VISITA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[PACIENTE] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VISITA]    Script Date: 25/08/2024 20:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISITA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[TIPO_VISITA_ID] [int] NULL,
	[CENTRO_SALUD] [varchar](225) NOT NULL,
	[ID_PACIENTE] [int] NOT NULL,
	[SIGNOS_VITALES] [varchar](100) NULL,
	[OBSERVACIONES] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] ADD  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[VISITA] ADD  DEFAULT (getdate()) FOR [FECHA]
GO
ALTER TABLE [dbo].[DETALLE_VISITA]  WITH CHECK ADD  CONSTRAINT [KF_DATALLE_VISITA] FOREIGN KEY([ID_PACIENTE])
REFERENCES [dbo].[PACIENTE] ([ID])
GO
ALTER TABLE [dbo].[DETALLE_VISITA] CHECK CONSTRAINT [KF_DATALLE_VISITA]
GO
ALTER TABLE [dbo].[DETALLE_VISITA]  WITH CHECK ADD  CONSTRAINT [KF_VISITA_ID] FOREIGN KEY([VISITA_ID])
REFERENCES [dbo].[VISITA] ([ID])
GO
ALTER TABLE [dbo].[DETALLE_VISITA] CHECK CONSTRAINT [KF_VISITA_ID]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_ID_PACIENTE] FOREIGN KEY([ID_PACIENTE])
REFERENCES [dbo].[VISITA] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_ID_PACIENTE]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_SUCURSALES_ID] FOREIGN KEY([SUCURSALES_ID])
REFERENCES [dbo].[CENTRO_SALUD] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_SUCURSALES_ID]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_REGEISTRO_ID] FOREIGN KEY([TIPO_REGISTRO_ID])
REFERENCES [dbo].[TIPO_REGISTRO] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_TIPO_REGEISTRO_ID]
GO
ALTER TABLE [dbo].[REGISTRO_SALUD]  WITH CHECK ADD  CONSTRAINT [FK_VISITA] FOREIGN KEY([VISITA])
REFERENCES [dbo].[VISITA] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_SALUD] CHECK CONSTRAINT [FK_VISITA]
GO
ALTER TABLE [dbo].[VISITA]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_VISITA_ID] FOREIGN KEY([TIPO_VISITA_ID])
REFERENCES [dbo].[TIPO_VISITA] ([ID])
GO
ALTER TABLE [dbo].[VISITA] CHECK CONSTRAINT [FK_TIPO_VISITA_ID]
GO
USE [master]
GO
ALTER DATABASE [dsrp_registro_salud] SET  READ_WRITE 
GO
