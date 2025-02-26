USE [master]
GO
/****** Object:  Database [EvaluacionRed]    Script Date: 15/02/2022 06:42:46 PM ******/
CREATE DATABASE [EvaluacionRed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EvaluacionRed', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EvaluacionRed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EvaluacionRed_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EvaluacionRed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EvaluacionRed] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvaluacionRed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvaluacionRed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvaluacionRed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvaluacionRed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvaluacionRed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvaluacionRed] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvaluacionRed] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EvaluacionRed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvaluacionRed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvaluacionRed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvaluacionRed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvaluacionRed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvaluacionRed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvaluacionRed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvaluacionRed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvaluacionRed] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EvaluacionRed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvaluacionRed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvaluacionRed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvaluacionRed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvaluacionRed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvaluacionRed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvaluacionRed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvaluacionRed] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EvaluacionRed] SET  MULTI_USER 
GO
ALTER DATABASE [EvaluacionRed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvaluacionRed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvaluacionRed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvaluacionRed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EvaluacionRed] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EvaluacionRed] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EvaluacionRed] SET QUERY_STORE = OFF
GO
USE [EvaluacionRed]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](75) NOT NULL,
	[Apellido] [varchar](75) NOT NULL,
	[Cedula] [varchar](20) NOT NULL,
	[IdAula] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[IdAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignaciones]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[IdAsignacion] [int] IDENTITY(1,1) NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[IdMateria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aulas]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aulas](
	[IdAula] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [int] NULL,
	[Edificio] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[IdMateria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](75) NOT NULL,
	[IdProfesor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](75) NULL,
	[Apellido] [varchar](75) NULL,
	[Identificacion] [varchar](75) NULL,
	[IdAula] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promedios]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promedios](
	[IdPromedio] [int] IDENTITY(1,1) NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[Promedio] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPromedio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD FOREIGN KEY([IdAula])
REFERENCES [dbo].[Aulas] ([IdAula])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumnos] ([IdAlumno])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materias] ([IdMateria])
GO
ALTER TABLE [dbo].[Materias]  WITH CHECK ADD FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesores] ([IdProfesor])
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD FOREIGN KEY([IdAula])
REFERENCES [dbo].[Aulas] ([IdAula])
GO
ALTER TABLE [dbo].[Promedios]  WITH CHECK ADD FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumnos] ([IdAlumno])
GO
/****** Object:  StoredProcedure [dbo].[DeleteAlumnos]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAlumnos]
	@IdAlumno int
	AS   
	delete Alumnos
	where IdAlumno=@IdAlumno
      
GO
/****** Object:  StoredProcedure [dbo].[DeleteAsignacion]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAsignacion]
	@IdAsignacion int
	AS   
	delete Asignaciones
	where IdAsignacion=@IdAsignacion
      
GO
/****** Object:  StoredProcedure [dbo].[DeleteAula]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAula]
	@IdAula int
	AS   
	delete Aulas
	where IdAula=@IdAula
      
GO
/****** Object:  StoredProcedure [dbo].[DeleteMateria]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMateria]
	@IdMateria int
	AS   
	delete Materias
	where IdMateria=@IdMateria
      
GO
/****** Object:  StoredProcedure [dbo].[DeleteProfesor]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProfesor]
	@IdProfesor int
	AS   
	delete Profesores
	where IdProfesor=@IdProfesor
      
GO
/****** Object:  StoredProcedure [dbo].[DeletePromedio]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePromedio]
	@IdPromedio int
	AS   
	delete Promedios
	where IdPromedio=@IdPromedio
      
GO
/****** Object:  StoredProcedure [dbo].[InsertarAlumnos]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarAlumnos]
	@Nombre varchar(75),
    @Apellido varchar(75),   
    @Cedula varchar(25),
	@IdAula int
AS   
	insert into Alumnos
	values (@Nombre,@Apellido,@Cedula,@IdAula)
      
GO
/****** Object:  StoredProcedure [dbo].[InsertarAsignacion]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarAsignacion]
	
	@IdAlumno int,
    @IdMateria int
AS   
	insert into Asignaciones
	values(@IdAlumno,@IdMateria)
      
GO
/****** Object:  StoredProcedure [dbo].[InsertarAula]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarAula]
	
	@Numero int,
    @Edificio varchar(5)
AS   
	insert into Aulas
	values(@Numero,@Edificio)
      
GO
/****** Object:  StoredProcedure [dbo].[InsertarMaterias]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarMaterias]
	
	@Nombre varchar(50),
    @IdProfesor int
AS   
	insert into Materias
	values(@Nombre,@IdProfesor)
      
GO
/****** Object:  StoredProcedure [dbo].[InsertarProfesor]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarProfesor]
	
	@Nombre varchar(75),
    @Apellido varchar(75),   
    @Identificacion varchar(25),
	@IdAula int
AS   
	insert into Profesores
	values(@Nombre,@Apellido,@Identificacion,@IdAula)
      
GO
/****** Object:  StoredProcedure [dbo].[InsertarPromedio]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPromedio]
	
	@IdAlumno int,
    @Promedio float
AS   
	insert into Promedios
	values(@IdAlumno,@Promedio)
      
GO
/****** Object:  StoredProcedure [dbo].[UpdateAlumnos]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAlumnos]
	@IdAlumno int,
	@Nombre varchar(75),
    @Apellido varchar(75),   
    @Cedula varchar(25),
	@IdAula int
AS   
	Update Alumnos
	set Nombre=@Nombre,
	Apellido= @Apellido,
	Cedula= @Cedula,
	IdAula= @IdAula
	where IdAlumno=@IdAlumno
      
GO
/****** Object:  StoredProcedure [dbo].[UpdateAsignacion]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAsignacion]
	@IdAsignacion int,
	@IdAlumno int,
    @IdMateria int
	


AS   
	Update Asignaciones
	set IdAlumno=@IdAlumno,
	IdMateria= @IdMateria
	
	where IdAsignacion=@IdAsignacion
      
GO
/****** Object:  StoredProcedure [dbo].[UpdateAula]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAula]
	@IdAula int,
	@Numero int,
    @Edificio varchar(5)
	


AS   
	Update Aulas
	set Numero=@Numero,
	Edificio= @Edificio
	
	where IdAula=@IdAula
      
GO
/****** Object:  StoredProcedure [dbo].[UpdateMaterias]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMaterias]
	@IdMateria int,
	@Nombre varchar(50),
    @IdProfesor int
	


AS   
	Update Materias
	set Nombre=@Nombre,
	IdProfesor= @IdProfesor
	
	where IdMateria=@IdMateria
      
GO
/****** Object:  StoredProcedure [dbo].[UpdateProfesor]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProfesor]
	@IdProfesor int,
	@Nombre varchar(75),
    @Apellido varchar(75),   
    @Identificacion varchar(25),
	@IdAula int


AS   
	Update Profesores
	set Nombre=@Nombre,
	Apellido= @Apellido,
	Identificacion= @Identificacion,
	IdAula= @IdAula
	where IdProfesor=@IdProfesor
      
GO
/****** Object:  StoredProcedure [dbo].[UpdatePromedio]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePromedio]
	@IdPromedio int,
	@IdAlumno int,
    @Promedio float
	


AS   
	Update Promedios
	set IdAlumno=@IdAlumno,
	Promedio= @Promedio
	
	where IdPromedio=@IdPromedio
      
GO
/****** Object:  StoredProcedure [dbo].[VerAlumnos]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VerAlumnos]

	AS   
select * from Alumnos     
GO
/****** Object:  StoredProcedure [dbo].[VerAsignaciones]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VerAsignaciones]

	AS   
select * from Asignaciones  
GO
/****** Object:  StoredProcedure [dbo].[VerAulaID]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[VerAulaID]
@IdAula int
as

select a.IdAula,a.Numero,a.Edificio  from Aulas as A
where A.IdAula=@IdAula
GO
/****** Object:  StoredProcedure [dbo].[VerAulas]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VerAulas]

	AS   
select * from Aulas    
GO
/****** Object:  StoredProcedure [dbo].[VerProfesores]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VerProfesores]

	AS   
select * from Profesores     
GO
/****** Object:  StoredProcedure [dbo].[VerPromedios]    Script Date: 15/02/2022 06:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VerPromedios]

	AS   
select * from Promedios    
GO
USE [master]
GO
ALTER DATABASE [EvaluacionRed] SET  READ_WRITE 
GO
