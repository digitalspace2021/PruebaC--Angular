USE [Seguros_ABC]
GO
/****** Object:  User [call]    Script Date: 28/09/2022 17:04:37 ******/
CREATE USER [call] FOR LOGIN [call] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [call]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/09/2022 17:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[nombre_completo] [nvarchar](50) NULL,
	[cedula] [nvarchar](10) NOT NULL,
	[pin] [numeric](4, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 28/09/2022 17:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[id_pago] [numeric](3, 0) NOT NULL,
	[cedula] [nvarchar](10) NOT NULL,
	[fecha_pago] [date] NULL,
	[monto] [float] NULL,
 CONSTRAINT [pk_id_pago] PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Cliente] ([nombre_completo], [cedula], [pin]) VALUES (N'Juan Perez', N'8-75-584', CAST(1478 AS Numeric(4, 0)))
INSERT [dbo].[Cliente] ([nombre_completo], [cedula], [pin]) VALUES (N'Miguel Batista', N'PE-254-845', CAST(1244 AS Numeric(4, 0)))
INSERT [dbo].[Pagos] ([id_pago], [cedula], [fecha_pago], [monto]) VALUES (CAST(1 AS Numeric(3, 0)), N'8-75-584', CAST(N'2021-04-04' AS Date), 200)
INSERT [dbo].[Pagos] ([id_pago], [cedula], [fecha_pago], [monto]) VALUES (CAST(2 AS Numeric(3, 0)), N'8-75-584', CAST(N'2021-01-05' AS Date), 198.22)
INSERT [dbo].[Pagos] ([id_pago], [cedula], [fecha_pago], [monto]) VALUES (CAST(3 AS Numeric(3, 0)), N'8-75-584', CAST(N'2021-01-06' AS Date), 210)
INSERT [dbo].[Pagos] ([id_pago], [cedula], [fecha_pago], [monto]) VALUES (CAST(4 AS Numeric(3, 0)), N'PE-254-845', CAST(N'2021-04-30' AS Date), 200)
INSERT [dbo].[Pagos] ([id_pago], [cedula], [fecha_pago], [monto]) VALUES (CAST(5 AS Numeric(3, 0)), N'PE-254-845', CAST(N'2021-03-29' AS Date), 198.22)
INSERT [dbo].[Pagos] ([id_pago], [cedula], [fecha_pago], [monto]) VALUES (CAST(6 AS Numeric(3, 0)), N'PE-254-845', CAST(N'2021-02-17' AS Date), 210)
/****** Object:  StoredProcedure [dbo].[ConsultaPagosCliente]    Script Date: 28/09/2022 17:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultaPagosCliente]
	-- Add the parameters for the stored procedure here
	@cedula nvarchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--SELECT <@Param1, sysname, @p1>

	 if @cedula ='' 
	 
	 
	 select c.[cedula],c.nombre_completo, p.fecha_pago,p.monto
	 from [Seguros_ABC].[dbo].[Cliente] c
	 join [Seguros_ABC].[dbo].Pagos p on p.cedula=c.cedula
	 group by c.[cedula],c.nombre_completo, p.fecha_pago,p.monto
	 order by p.fecha_pago desc;
	 


 else
	 select c.[cedula],c.nombre_completo, p.fecha_pago,p.monto
	 from [Seguros_ABC].[dbo].[Cliente] c
	 join [Seguros_ABC].[dbo].Pagos p on p.cedula=c.cedula
	 where c.cedula= @cedula
	 group by c.[cedula],c.nombre_completo, p.fecha_pago,p.monto
	 order by p.fecha_pago desc;
	 
END


GO
