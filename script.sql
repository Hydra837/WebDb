USE [master]
GO
/****** Object:  Database [Web]    Script Date: 26-08-24 16:26:16 ******/
CREATE DATABASE [Web]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web', FILENAME = N'D:\MSSQL16.SQLEXPRESS\MSSQL\DATA\Web.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web_log', FILENAME = N'D:\MSSQL16.SQLEXPRESS\MSSQL\DATA\Web_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Web] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Web] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Web] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Web] SET  MULTI_USER 
GO
ALTER DATABASE [Web] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Web] SET QUERY_STORE = ON
GO
ALTER DATABASE [Web] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Web]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignements]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[CoursId] [int] NOT NULL,
	[IsAvailable] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cours]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cours](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Disponible] [bit] NULL,
	[date_debut] [datetime] NULL,
	[date_fin] [datetime] NULL,
	[Description] [nvarchar](50) NULL,
	[ProfesseurId] [int] NULL,
 CONSTRAINT [PK_Cours] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_nom_cours] UNIQUE NONCLUSTERED 
(
	[Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_nom_prof] UNIQUE NONCLUSTERED 
(
	[ProfesseurId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Grade] [int] NOT NULL,
	[UserId] [int] NULL,
	[Available] [bit] NULL,
	[AssignementsId] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_grade_grade_AssignemntId] UNIQUE NONCLUSTERED 
(
	[AssignementsId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Roles] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Enrollement]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Enrollement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoursId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Course_Management] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Management]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Management](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfesseurId] [int] NOT NULL,
	[CoursId] [int] NOT NULL,
	[EtudiantId] [int] NULL,
 CONSTRAINT [PK_Student_Management] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Passwd] [nvarchar](256) NOT NULL,
	[Nom] [nvarchar](50) NULL,
	[Prenom] [nvarchar](50) NULL,
	[Roles] [nvarchar](50) NOT NULL,
	[Pseudo] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NULL,
	[Salt] [nvarchar](256) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assignements] ADD  CONSTRAINT [DF_Assignement_IsAvailable]  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[Cours] ADD  CONSTRAINT [DF_Cours_Disponible]  DEFAULT ((1)) FOR [Disponible]
GO
ALTER TABLE [dbo].[Grade] ADD  CONSTRAINT [DF_Grade_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Student_Enrollement] ADD  CONSTRAINT [DF_Student_Enrollement_Grade]  DEFAULT (NULL) FOR [Grade]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Users1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Users1]
GO
ALTER TABLE [dbo].[Student_Enrollement]  WITH CHECK ADD  CONSTRAINT [FK_Student_Enrollement_Cours] FOREIGN KEY([CoursId])
REFERENCES [dbo].[Cours] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student_Enrollement] CHECK CONSTRAINT [FK_Student_Enrollement_Cours]
GO
ALTER TABLE [dbo].[Student_Management]  WITH CHECK ADD  CONSTRAINT [FK_Student_Management_Cours1] FOREIGN KEY([CoursId])
REFERENCES [dbo].[Cours] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student_Management] CHECK CONSTRAINT [FK_Student_Management_Cours1]
GO
ALTER TABLE [dbo].[Student_Management]  WITH CHECK ADD  CONSTRAINT [FK_Student_Management_Users1] FOREIGN KEY([ProfesseurId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student_Management] CHECK CONSTRAINT [FK_Student_Management_Users1]
GO
ALTER TABLE [dbo].[Cours]  WITH CHECK ADD  CONSTRAINT [chk_date_valid] CHECK  (([date_debut]<=[date_fin]))
GO
ALTER TABLE [dbo].[Cours] CHECK CONSTRAINT [chk_date_valid]
GO
ALTER TABLE [dbo].[Student_Enrollement]  WITH CHECK ADD  CONSTRAINT [CK_Student_Enrollement] CHECK  (([Grade]>(0) OR [Grade]<(100)))
GO
ALTER TABLE [dbo].[Student_Enrollement] CHECK CONSTRAINT [CK_Student_Enrollement]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [chk_roles] CHECK  (([Roles]='Etudiant' OR [Roles]='Professeur' OR [Roles]='Admin'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [chk_roles]
GO
/****** Object:  StoredProcedure [dbo].[AddCours]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCours]
    @Nom NVARCHAR(100),
    @Description NVARCHAR(255),
    @DateDebut DATETIME,
    @DateFin DATETIME
AS
BEGIN
    -- Valider les entrées
    IF LEN(@Nom) = 0
    BEGIN
        RAISERROR('Le nom du cours est requis.', 16, 1);
        RETURN;
    END

    IF @DateDebut >= @DateFin
    BEGIN
        RAISERROR('La date de début doit être antérieure à la date de fin.', 16, 1);
        RETURN;
    END

    -- Insérer les données dans la table Cours
    BEGIN TRY
        INSERT INTO Cours (Nom, date_debut, date_fin)
        VALUES (@Nom, @DateDebut, @DateFin);
    END TRY
    BEGIN CATCH
        -- Gestion des erreurs
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[AddRoleToUser]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRoleToUser]
    @UserId INT,
    @Role NVARCHAR(255)
AS
BEGIN
    DECLARE @CurrentRoles NVARCHAR(1000);

    -- Vérifier si l'utilisateur existe
    IF EXISTS (SELECT 1 FROM Users WHERE Id = @UserId)
    BEGIN
        -- Récupérer les rôles actuels de l'utilisateur
        SELECT @CurrentRoles = Roles
        FROM Users
        WHERE Id = @UserId;

        -- Vérifier si le rôle existe déjà dans la liste des rôles
        IF CHARINDEX(@Role, @CurrentRoles) = 0
        BEGIN
            -- Ajouter le nouveau rôle
            SET @CurrentRoles = CASE
                                   WHEN LEN(@CurrentRoles) = 0 THEN @Role
                                   ELSE @CurrentRoles + ',' + @Role
                                END;

            -- Mettre à jour la colonne des rôles de l'utilisateur
            UPDATE Users
            SET Roles = @CurrentRoles
            WHERE Id = @UserId;
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[AddStudentEnrollment]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStudentEnrollment]
    @CoursId INT,
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Vérifier si l'utilisateur et le cours existent
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE Id = @CoursId)
    BEGIN
        RAISERROR('Le cours avec Id = %d n''existe pas.', 16, 1, @CoursId);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Users WHERE Id = @UserId)
    BEGIN
        RAISERROR('L''utilisateur avec Id = %d n''existe pas.', 16, 2, @UserId);
        RETURN;
    END

    -- Vérifier si l'enregistrement existe déjà
    IF EXISTS (SELECT 1 FROM Student__Enrollement WHERE CoursId = @CoursId AND UserId = @UserId)
    BEGIN
        RAISERROR('L''utilisateur avec Id = %d est déjà inscrit au cours avec Id = %d.', 16, 3, @UserId, @CoursId);
        RETURN;
    END

    -- Insérer l'enregistrement dans Student_Enrollment
    INSERT INTO Student__Enrollement (CoursId, UserId)
    VALUES (@CoursId, @UserId);

    -- Retourner l'ID de l'inscription créée
END
GO
/****** Object:  StoredProcedure [dbo].[delete_cours]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_cours]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Vérifier l'existence du cours
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE Id = @Id)
    BEGIN
        -- Retourner une erreur si le cours n'existe pas
        DECLARE @ErrorMessage NVARCHAR(200) = 'Le cours avec Id = ' + CAST(@Id AS NVARCHAR(10)) + ' n''existe pas.';
        RAISERROR(@ErrorMessage, 16, 1);
        RETURN;
    END

    -- Supprimer le cours
    DELETE FROM Cours WHERE Id = @Id;

    -- Message de succès
    SELECT 'Le cours avec Id = ' + CAST(@Id AS NVARCHAR(10)) + ' a été supprimé.' AS Message;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudentFromCourse]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudentFromCourse]
    @StudentId INT,
    @CourseId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Vérifier le rôle de l'utilisateur dans la table Users
    DECLARE @UserRole NVARCHAR(50);
    SELECT @UserRole = Role FROM [User] WHERE Id = @StudentId;

    -- Vérifier si l'utilisateur est un étudiant
    IF @UserRole = 'Student'
    BEGIN
        -- Supprimer l'association de l'étudiant avec le cours dans la table Management
        DELETE FROM Student_Management
        WHERE StudentId = @StudentId AND CourseId = @CourseId;
    END
    ELSE
    BEGIN
        -- Retourner une erreur si l'utilisateur n'est pas un étudiant
        RAISERROR ('User n est pas un étudiant.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllCoursesByUser]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCoursesByUser]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserRole NVARCHAR(50);

    -- Vérifier le rôle de l'utilisateur
    SELECT @UserRole = Roles FROM Users WHERE Id = @UserId;

    -- Vérifier si l'utilisateur a le rôle d'étudiant
    IF @UserRole = 'Etudiant'
    BEGIN
        -- Sélectionner les cours de l'étudiant
        SELECT c.Id AS CourseId, c.CourseName, c.CourseCode
        FROM Courses c
        INNER JOIN UserCourses uc ON c.Id = uc.CourseId
        WHERE uc.UserId = @UserId;
    END
    ELSE
    BEGIN
        -- Retourner une erreur si l'utilisateur n'est pas un étudiant
        RAISERROR ('Vous n est pas autorisé.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllCoursesForCurrentUser]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCoursesForCurrentUser]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserId INT;

    -- Obtenir l'ID de l'utilisateur connecté
    SET @UserId = CAST(SESSION_CONTEXT(N'UserId') AS INT);

    -- Vérifier le rôle de l'utilisateur
    DECLARE @UserRole NVARCHAR(50);
    SELECT @UserRole = Roles FROM Users WHERE Id = @UserId;

    -- Vérifier si l'utilisateur a le rôle d'étudiant
    IF @UserRole = 'Etudiant'
    BEGIN
        -- Sélectionner les cours de l'étudiant
        SELECT c.Id AS CourseId, c.Nom
        FROM Cours c
        INNER JOIN Student_Management uc ON c.Id = uc.CourseId
        WHERE uc.StudentId = @UserId;
    END
    ELSE
    BEGIN
        -- Retourner une erreur si l'utilisateur n'est pas un étudiant
        RAISERROR ('Vous n estes pas autorise.', 16, 1);
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[GetAllProfessorsCoursesAssignmentsGrades]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProfessorsCoursesAssignmentsGrades]
AS
BEGIN
    -- Créer les tables temporaires pour stocker les résultats intermédiaires
    CREATE TABLE #ProfessorCourses (
        UserId INT,
        UserName NVARCHAR(100),
        CoursId INT,
        CoursName NVARCHAR(100)
    );

    CREATE TABLE #Assignments (
        AssignmentId INT,
        CoursId INT,
        Title NVARCHAR(100)
    );

    CREATE TABLE #Grades (
        AssignmentId INT,
        UserId INT,
        Grade DECIMAL(5, 2)
    );

    -- Insérer les cours des professeurs dans la table temporaire
    INSERT INTO #ProfessorCourses (UserId, UserName, CoursId, CoursName)
    SELECT 
        u.Id AS UserId,
        u.Nom AS UserName,
        c.Id AS CoursId,
        c.Nom AS CoursName
    FROM Cours c
    JOIN Users u ON c.ProfesseurId = u.Id
    WHERE u.Roles = 'Professeur';

    -- Insérer les assignments pour les cours dans la table temporaire
    INSERT INTO #Assignments (AssignmentId, CoursId, Title)
    SELECT 
        a.Id AS AssignmentId,
        a.CoursId AS CoursId,
        a.Description AS Title
    FROM Assignements a
    WHERE a.CoursId IN (SELECT DISTINCT CoursId FROM #ProfessorCourses);

    -- Insérer les grades pour les assignments des étudiants dans la table temporaire
    INSERT INTO #Grades (AssignmentId, UserId, Grade)
    SELECT 
        g.AssignementsId AS AssignmentId,
        g.UserId AS UserId,
        g.Grade AS Grade
    FROM Grade g
    WHERE g.AssignementsId IN (SELECT DISTINCT AssignmentId FROM #Assignments);

    -- Sélectionner les résultats finaux en combinant les tables temporaires
    SELECT 
        pc.UserId,
        pc.UserName,
        pc.CoursId,
        pc.CoursName,
        a.AssignmentId,
        a.Title AS AssignmentTitle,
        g.Grade
    FROM #ProfessorCourses pc
    LEFT JOIN #Assignments a ON pc.CoursId = a.CoursId
    LEFT JOIN #Grades g ON a.AssignmentId = g.AssignmentId
    ORDER BY pc.UserId, pc.CoursId, a.AssignmentId;

    -- Nettoyer les tables temporaires
    DROP TABLE #ProfessorCourses;
    DROP TABLE #Assignments;
    DROP TABLE #Grades;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentsCoursesAssignmentsGrades]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentsCoursesAssignmentsGrades]
AS
BEGIN
    -- Créer les tables temporaires pour stocker les résultats intermédiaires
    CREATE TABLE #StudentCourses (
        UserId INT,
        UserName NVARCHAR(100),
        CoursId INT,
        CoursName NVARCHAR(100)
    );

    CREATE TABLE #Assignments (
        AssignmentId INT,
        CoursId INT,
        Title NVARCHAR(100)
    );

    CREATE TABLE #Grades (
        AssignmentId INT,
        UserId INT,
        Grade DECIMAL(5, 2)
    );

    -- Insérer les cours des étudiants dans la table temporaire
    INSERT INTO #StudentCourses (UserId, UserName, CoursId, CoursName)
    SELECT 
        u.Id AS UserId,
        u.Nom AS UserName,
        c.Id AS CoursId,
        c.Nom AS CoursName
    FROM Student_Enrollement se
    JOIN Users u ON se.UserId = u.Id
    JOIN Cours c ON se.CoursId = c.Id
    WHERE u.Roles = 'Etudiant';

    -- Insérer les assignments pour les cours dans la table temporaire
    INSERT INTO #Assignments (AssignmentId, CoursId, Title)
    SELECT 
        a.Id AS AssignmentId,
        a.CoursId AS CoursId,
        a.Description AS Description
    FROM Assignements a
    WHERE a.CoursId IN (SELECT DISTINCT CoursId FROM #StudentCourses);

    -- Insérer les grades pour les assignments des étudiants dans la table temporaire
    INSERT INTO #Grades (AssignmentId, UserId, Grade)
    SELECT 
        g.AssignementsId as Assignements,
        g.UserId AS UserId,
        g.Grade AS Grade
    FROM Grade g
    WHERE g.UserId IN (SELECT DISTINCT UserId FROM #StudentCourses);

    -- Sélectionner les résultats finaux en combinant les tables temporaires
    SELECT 
        sc.UserId,
        sc.UserName,
        sc.CoursId,
        sc.CoursName,
        a.AssignmentId,
        a.Title AS AssignmentTitle,
        g.Grade
    FROM #StudentCourses sc
    LEFT JOIN #Assignments a ON sc.CoursId = a.CoursId
    LEFT JOIN #Grades g ON a.AssignmentId = g.AssignmentId AND sc.UserId = g.UserId
    ORDER BY sc.UserId, sc.CoursId, a.AssignmentId;

    -- Nettoyer les tables temporaires
    DROP TABLE #StudentCourses;
    DROP TABLE #Assignments;
    DROP TABLE #Grades;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCours]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvailableCours]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT *
    FROM Cours
    WHERE Disponible = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserCourseDetails]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserCourseDetails]
AS
BEGIN
    BEGIN TRY
        SELECT 
            u.Id AS UserId,
            u.Nom AS UserNom,
            u.Prenom AS UserPrenom,
            c.Id AS CourseId,
            c.Nom AS CoursNom,
            c.Disponible,
            uc.Grade , -- Inclure le grade
            p.Nom AS ProfNom,
            p.Prenom AS ProfPrenom
        FROM 
            Users u
        INNER JOIN 
            Student_Enrollement uc ON u.Id = uc.UserId
        INNER JOIN 
            Cours c ON uc.CoursId = c.Id
        LEFT JOIN 
            Users p ON c.ProfesseurId = p.Id AND p.Roles = 'Professeur' -- Joindre la table des professeurs pour obtenir les informations
       -- WHERE 
        --    u.Roles = 'Etudiant'
        ORDER BY 
            u.Id, c.Id;
    END TRY
    BEGIN CATCH
        -- Gérer les erreurs
        RAISERROR('An error occurred while processing your request.', 16, 1);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserCourseDetailsId]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserCourseDetailsId]
    @UserId INT
AS
BEGIN
    BEGIN TRY
      --  IF @UserId IS NULL OR @UserId <= 0
        --BEGIN
          --  RAISERROR('Invalid UserId', 16, 1);
            --RETURN;
      --  END

        SELECT 
            u.Id AS UserId,
            u.Nom AS UserNom,
            u.Prenom AS UserPrenom,
            c.Nom AS CoursNom,
            c.Disponible,
            p.Nom AS ProfNom,
            p.Prenom AS ProfPrenom
        FROM 
            Users u
        INNER JOIN 
            Student__Enrollement uc ON u.Id = uc.UserId
        INNER JOIN 
            Cours c ON uc.CoursId = c.Id
        INNER JOIN 
            Student_Management m ON c.Id = m.CoursId
        INNER JOIN 
            Users p ON m.ProfesseurId = p.Id AND p.Roles = 'professeur'
        WHERE 
            u.Roles = 'etudiant' AND u.Id = @UserId
        ORDER BY 
            u.Id, c.Id;
    END TRY
    BEGIN CATCH
        -- Gérer les erreurs
        RAISERROR('An error occurred while processing your request.', 16, 1);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserCoursesAssignmentsGrades]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserCoursesAssignmentsGrades]
    @UserId INT
AS
BEGIN
    -- Gestion des erreurs
    BEGIN TRY
        -- Créer les tables temporaires pour stocker les résultats intermédiaires
        CREATE TABLE #UserCourses (
            CoursId INT PRIMARY KEY,
            CoursName NVARCHAR(100)
        );

        CREATE TABLE #Assignments (
            AssignmentId INT PRIMARY KEY,
            CoursId INT,
            Title NVARCHAR(100)
        );

        CREATE TABLE #Grades (
            AssignmentId INT,
            UserId INT,
            Grade DECIMAL(5, 2)
        );

        -- Insérer les cours de l'utilisateur dans la table temporaire
        INSERT INTO #UserCourses (CoursId, CoursName)
        SELECT DISTINCT c.Id, c.Nom
        FROM Student_Enrollement se
        JOIN Cours c ON se.CoursId = c.Id
        WHERE se.UserId = @UserId;

        -- Insérer les assignments pour les cours de l'utilisateur dans la table temporaire
        INSERT INTO #Assignments (AssignmentId, CoursId, Title)
        SELECT a.Id, a.CoursId, a.Description
        FROM Assignements a
        WHERE a.CoursId IN (SELECT CoursId FROM #UserCourses);

        -- Insérer les grades pour les assignments dans la table temporaire
        INSERT INTO #Grades (AssignmentId, UserId, Grade)
        SELECT g.AssignementsId, g.UserId, g.Grade
        FROM Grade g
        WHERE g.UserId = @UserId;

        -- Sélectionner les résultats finaux en combinant les tables temporaires
        SELECT 
            uc.CoursId,
            u.Nom AS Nom,
            u.Prenom AS Prenom,
            uc.CoursName,
            a.AssignmentId,
            a.Title AS AssignmentTitle,
            g.Grade
        FROM #UserCourses uc
        LEFT JOIN #Assignments a ON uc.CoursId = a.CoursId
        LEFT JOIN #Grades g ON a.AssignmentId = g.AssignmentId
        JOIN Users u ON u.Id = @UserId  -- S'assurer que l'utilisateur existe dans la table Users
        ORDER BY uc.CoursId, a.AssignmentId;

        -- Nettoyer les tables temporaires
        DROP TABLE #UserCourses;
        DROP TABLE #Assignments;
        DROP TABLE #Grades;
    END TRY
    BEGIN CATCH
        -- En cas d'erreur, nettoyage des tables temporaires et gestion de l'erreur
        IF OBJECT_ID('tempdb..#UserCourses') IS NOT NULL DROP TABLE #UserCourses;
        IF OBJECT_ID('tempdb..#Assignments') IS NOT NULL DROP TABLE #Assignments;
        IF OBJECT_ID('tempdb..#Grades') IS NOT NULL DROP TABLE #Grades;

        -- Renvoyer l'erreur
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertStudentEnrollment]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudentEnrollment]
    @UserId INT,
    @CourseId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Vérifier si l'inscription existe déjà
    IF EXISTS (SELECT 1 FROM Student_Enrollement WHERE UserId = @UserId AND CoursId = @CourseId)
    BEGIN
        -- L'inscription existe déjà, lever une erreur
        THROW 50000, 'L''étudiant est déjà inscrit à ce cours.', 1;
        RETURN;
    END

    -- Insérer une nouvelle inscription
    INSERT INTO Student_Enrollement (UserId, CoursId)
    VALUES (@UserId, @CourseId);
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCours]    Script Date: 26-08-24 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCours]
    @Id INT,
    @Nom NVARCHAR(100),
    @DateDebut DATETIME,
    @DateFin DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    -- Vérifier l'existence du cours
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE Id = @Id)
    BEGIN
        RAISERROR('Le cours avec Id = %d n''existe pas.', 16, 1, @Id);
        RETURN;
    END

    -- Mettre à jour les colonnes Nom, DateDebut, DateFin
    UPDATE Cours
    SET Nom = @Nom,
        date_debut = @DateDebut,
        date_fin = @DateFin
    WHERE Id = @Id;

    SELECT @@ROWCOUNT AS RowsAffected; -- Retourner le nombre de lignes modifiées
END
GO
USE [master]
GO
ALTER DATABASE [Web] SET  READ_WRITE 
GO
