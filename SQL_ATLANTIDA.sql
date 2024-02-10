CREATE DATABASE [ATLANTIDA_TARJETA_DB]
USE [ATLANTIDA_TARJETA_DB]
GO
/****** Object:  Table [dbo].[DetalleTransacciones]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleTransacciones](
	[idDetalleTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[idTransaccion] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Monto] [float] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_DetalleTransacciones] PRIMARY KEY CLUSTERED 
(
	[idDetalleTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[URL] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuXRol]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuXRol](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[idMenu] [int] NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_MenuXRol] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[idParametro] [int] IDENTITY(1,1) NOT NULL,
	[NombreParametro] [varchar](50) NOT NULL,
	[Valor] [float] NOT NULL,
 CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED 
(
	[idParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Telefono] [varchar](8) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[idTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idTipoTarjeta] [int] NOT NULL,
	[NumeroTarjeta] [varchar](16) NOT NULL,
	[Saldo] [float] NOT NULL,
	[SaldoDisponible] [float] NOT NULL,
	[LimiteCrediticio] [float] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[idTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTarjeta](
	[idTipoTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[TipoTarjeta] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoTarjeta] PRIMARY KEY CLUSTERED 
(
	[idTipoTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTransaccion]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTransaccion](
	[idTipoTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[TipoTransaccion] [varchar](25) NOT NULL,
 CONSTRAINT [PK_TipoTransaccion] PRIMARY KEY CLUSTERED 
(
	[idTipoTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[idTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[idTarjeta] [int] NOT NULL,
	[idTipoTransaccion] [int] NOT NULL,
	[Monto] [float] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[idTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[NombreUsuario] [varchar](25) NOT NULL,
	[Clave] [varchar](25) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetalleTransacciones] ON 

INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (1, 9, N'1', 150, CAST(N'2024-02-07T18:10:29.823' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (7, 15, N'Test', 25, CAST(N'2024-02-08T15:59:50.947' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (8, 16, N'¨Pago', 625, CAST(N'2024-02-08T16:01:18.120' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (9, 17, N'Compra 2', 15, CAST(N'2024-02-08T16:17:15.857' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (10, 18, N'Testing', 2, CAST(N'2024-02-08T21:46:43.063' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (11, 19, N'Descripcion', 25, CAST(N'2024-02-09T11:42:36.090' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (12, 20, N'Segunda compra', 50, CAST(N'2024-02-09T11:48:44.310' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (13, 21, N'Compra 3', 100, CAST(N'2024-02-09T11:51:45.317' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (14, 22, N'Compra ', 25, CAST(N'2024-02-09T14:10:55.880' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (15, 23, N'Testing', 125, CAST(N'2024-02-09T14:22:22.820' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (16, 24, N'Pago testing 2', 25, CAST(N'2024-02-09T14:35:43.077' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (17, 25, N'Shoes', 25, CAST(N'2024-02-09T14:40:10.277' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (18, 26, N'Shoes 1', 25, CAST(N'2024-02-09T14:40:45.683' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (19, 27, N'shoes', 10, CAST(N'2024-02-09T14:41:49.263' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (20, 28, N'Testin', 1, CAST(N'2024-02-09T14:53:28.817' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (21, 29, N'Testing', 25, CAST(N'2024-02-09T14:59:33.080' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (22, 30, N'Shoes', 17.5, CAST(N'2024-02-09T15:02:35.197' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (23, 31, N'Validacion', 10, CAST(N'2024-02-09T16:12:03.617' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (24, 32, N'Descripcion', 25, CAST(N'2024-02-09T16:49:04.030' AS DateTime))
INSERT [dbo].[DetalleTransacciones] ([idDetalleTransaccion], [idTransaccion], [Descripcion], [Monto], [FechaRegistro]) VALUES (25, 33, N'Test desde swagger', 15, CAST(N'2024-02-09T18:12:27.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[DetalleTransacciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([idMenu], [Descripcion], [URL]) VALUES (1, N'Compras', N'Purcharse/Index')
INSERT [dbo].[Menu] ([idMenu], [Descripcion], [URL]) VALUES (2, N'Pagos', N'Payments/Index')
INSERT [dbo].[Menu] ([idMenu], [Descripcion], [URL]) VALUES (3, N'Historial Transacciones', N'Transactions/Index')
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuXRol] ON 

INSERT [dbo].[MenuXRol] ([idPerfil], [idMenu], [idRol]) VALUES (1, 1, 1)
INSERT [dbo].[MenuXRol] ([idPerfil], [idMenu], [idRol]) VALUES (2, 2, 1)
INSERT [dbo].[MenuXRol] ([idPerfil], [idMenu], [idRol]) VALUES (3, 3, 1)
INSERT [dbo].[MenuXRol] ([idPerfil], [idMenu], [idRol]) VALUES (4, 1, 2)
INSERT [dbo].[MenuXRol] ([idPerfil], [idMenu], [idRol]) VALUES (5, 2, 2)
SET IDENTITY_INSERT [dbo].[MenuXRol] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([idPersona], [Nombre], [Apellido], [Telefono], [Activo]) VALUES (1, N'Rudy', N'Colocho', N'00000000', 1)
INSERT [dbo].[Persona] ([idPersona], [Nombre], [Apellido], [Telefono], [Activo]) VALUES (2, N'Usuario', N'Demo', N'00000000', 1)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRol], [Descripcion], [Activo]) VALUES (1, N'Usuario', 1)
INSERT [dbo].[Roles] ([IdRol], [Descripcion], [Activo]) VALUES (2, N'Usuario Demo', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([idTarjeta], [idPersona], [idTipoTarjeta], [NumeroTarjeta], [Saldo], [SaldoDisponible], [LimiteCrediticio]) VALUES (1, 1, 1, N'0000000000000000', 57, 2943, 3000)
INSERT [dbo].[Tarjeta] ([idTarjeta], [idPersona], [idTipoTarjeta], [NumeroTarjeta], [Saldo], [SaldoDisponible], [LimiteCrediticio]) VALUES (2, 1, 2, N'0000000000000001', 361.5, 2638.5, 3000)
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoTarjeta] ON 

INSERT [dbo].[TipoTarjeta] ([idTipoTarjeta], [TipoTarjeta]) VALUES (1, N'Debito')
INSERT [dbo].[TipoTarjeta] ([idTipoTarjeta], [TipoTarjeta]) VALUES (2, N'Credito')
SET IDENTITY_INSERT [dbo].[TipoTarjeta] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoTransaccion] ON 

INSERT [dbo].[TipoTransaccion] ([idTipoTransaccion], [TipoTransaccion]) VALUES (1, N'Compra')
INSERT [dbo].[TipoTransaccion] ([idTipoTransaccion], [TipoTransaccion]) VALUES (2, N'Pago')
SET IDENTITY_INSERT [dbo].[TipoTransaccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Transacciones] ON 

INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2024-02-06T22:29:16.743' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (2, 1, 1, 5, CAST(N'2024-02-06T22:31:05.137' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (3, 1, 2, 15, CAST(N'2024-02-06T22:33:30.873' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (4, 1, 2, 10, CAST(N'2024-02-06T22:44:27.603' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (5, 1, 2, 7, CAST(N'2024-02-06T22:44:50.383' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (6, 1, 2, 3, CAST(N'2024-02-06T22:54:32.200' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (7, 1, 2, 3, CAST(N'2024-02-06T22:56:49.700' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (8, 1, 2, 3.5, CAST(N'2024-02-06T23:02:54.207' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (9, 1, 1, 150, CAST(N'2024-02-07T18:10:09.583' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (15, 1, 1, 25, CAST(N'2024-02-08T15:59:42.437' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (16, 1, 2, 625, CAST(N'2024-02-08T16:01:18.103' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (17, 1, 1, 15, CAST(N'2024-02-08T16:17:15.773' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (18, 1, 1, 2, CAST(N'2024-02-08T21:46:42.920' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (19, 2, 1, 25, CAST(N'2024-02-09T11:42:35.967' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (20, 2, 1, 50, CAST(N'2024-02-09T11:48:44.283' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (21, 2, 1, 100, CAST(N'2024-02-09T11:51:45.280' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (22, 1, 1, 25, CAST(N'2024-02-09T14:10:55.803' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (23, 2, 1, 125, CAST(N'2024-02-09T14:22:22.733' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (24, 2, 2, 25, CAST(N'2024-02-09T14:35:42.987' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (25, 2, 1, 25, CAST(N'2024-02-09T14:40:10.180' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (26, 2, 1, 25, CAST(N'2024-02-09T14:40:45.670' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (27, 2, 1, 10, CAST(N'2024-02-09T14:41:49.253' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (28, 2, 2, 1, CAST(N'2024-02-09T14:53:28.713' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (29, 2, 2, 25, CAST(N'2024-02-09T14:59:33.060' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (30, 2, 1, 17.5, CAST(N'2024-02-09T15:02:35.187' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (31, 2, 1, 10, CAST(N'2024-02-09T16:12:03.353' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (32, 2, 1, 25, CAST(N'2024-02-09T16:49:03.940' AS DateTime))
INSERT [dbo].[Transacciones] ([idTransaccion], [idTarjeta], [idTipoTransaccion], [Monto], [FechaRegistro]) VALUES (33, 1, 1, 15, CAST(N'2024-02-09T18:12:27.100' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transacciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [NombreUsuario], [Clave], [Activo]) VALUES (2, 1, 1, N'rudy515', N'12345', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [NombreUsuario], [Clave], [Activo]) VALUES (3, 2, 2, N'demo', N'12345', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DetalleTransacciones]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionesDetalleTransacciones] FOREIGN KEY([idTransaccion])
REFERENCES [dbo].[Transacciones] ([idTransaccion])
GO
ALTER TABLE [dbo].[DetalleTransacciones] CHECK CONSTRAINT [FK_TransaccionesDetalleTransacciones]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_PersonaTarjeta] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_PersonaTarjeta]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_TipoTarjetaTarjeta] FOREIGN KEY([idTipoTarjeta])
REFERENCES [dbo].[TipoTarjeta] ([idTipoTarjeta])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_TipoTarjetaTarjeta]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_TarjetaTransacciones] FOREIGN KEY([idTarjeta])
REFERENCES [dbo].[Tarjeta] ([idTarjeta])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_TarjetaTransacciones]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_TipoTransaccionTransacciones] FOREIGN KEY([idTipoTransaccion])
REFERENCES [dbo].[TipoTransaccion] ([idTipoTransaccion])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_TipoTransaccionTransacciones]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_PersonaUsuario] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_PersonaUsuario]
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_ActualizarSaldo]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <07022024>
-- Description:	<ACTUALIZA LOS SALDOS DE LA TARJETA, DEPENDIENDO DEL TIPO DE TRANSACCION>
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_ActualizarSaldo] 
	-- Add the parameters for the stored procedure here
	@idTipoTransaccion		INT,
	@idTarjeta				INT,
	@monto					FLOAT,
	@idTarjetaModificado	INT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @idTipoTransaccion  = 1
	BEGIN
		--COMPRAS
		UPDATE Tarjeta SET SaldoDisponible = (SaldoDisponible - @monto), Saldo = (Saldo + @monto) WHERE idTarjeta = @idTarjeta
	END
	ELSE IF @idTipoTransaccion = 2
	BEGIN
		--PAGOS
		UPDATE Tarjeta SET SaldoDisponible = (SaldoDisponible + @monto), Saldo = (Saldo - @monto) WHERE idTarjeta = @idTarjeta
	END

	SET @idTarjetaModificado = @@ROWCOUNT

END
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_Compras]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <07022024>
-- Description:	<COMPRAS MENSUALES>
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_Compras] 
	-- Add the parameters for the stored procedure here
	@idTarjeta		INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	tr.FechaRegistro,
	dt.Descripcion,
	dt.Monto
	FROM Transacciones tr 
	INNER JOIN DetalleTransacciones dt ON tr.idTransaccion = dt.idTransaccion 
	WHERE 
	tr.idTarjeta = @idTarjeta AND
	MONTH(tr.FechaRegistro) = MONTH(GETDATE())
	OR
    MONTH(tr.FechaRegistro) = MONTH(DATEADD(MONTH, -1, GETDATE()))

	ORDER BY tr.FechaRegistro DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_HistoricoTransacciones]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <07022024>
-- Description:	<TRANSACCIONES MENSUALES>
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_HistoricoTransacciones]
	-- Add the parameters for the stored procedure here
	@idTarjeta		INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	tr.FechaRegistro,
	tp.TipoTransaccion AS Tipo,
	dt.Descripcion,
	dt.Monto
	FROM Transacciones tr 
	INNER JOIN DetalleTransacciones dt ON tr.idTransaccion = dt.idTransaccion 
	INNER JOIN TipoTransaccion tp ON tr.idTipoTransaccion = tp.idTipoTransaccion
	WHERE MONTH(tr.FechaRegistro) = MONTH(GETDATE())
	AND tr.idTarjeta = @idTarjeta
	ORDER BY tr.FechaRegistro DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_InsertarDetalleTransacion]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <07022024>
-- Description:	<INSERTA EL DETALLE DE TRANSACCION>
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_InsertarDetalleTransacion] 
	-- Add the parameters for the stored procedure here
	@idTransaccion	INT,
	@descripcion	VARCHAR(100),
	@monto			FLOAT,
	@idDetalle		INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO DetalleTransacciones(idTransaccion, Descripcion, Monto, FechaRegistro)
							  VALUES(@idTransaccion, @descripcion, @monto, GETDATE())

	SET @idDetalle = SCOPE_IDENTITY()

	SELECT @idDetalle
END
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_InsertarTransaccion]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <FEB062024>
-- Description:	<INSERTA UN TIPO DE TRANSCCION EN EL ENCABEZADO >
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_InsertarTransaccion] 
	-- Add the parameters for the stored procedure here
	@idTarjeta				INT, 
	@idTipoTransaccion		INT,
	@monto					FLOAT,
	@idTransaccion			INT OUTPUT
	--,
	--@fechaRegistro			DATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Transacciones(idTarjeta, idTipoTransaccion, Monto, FechaRegistro)
						VALUES(@idTarjeta, @idTipoTransaccion, @monto, GETDATE() )


	SET @idTransaccion = SCOPE_IDENTITY()
	SELECT @idTransaccion
	
END
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_ObtenerMenuxRol]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <08022024>
-- Description:	<OBTIENE EL MENU POR ROLES>
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_ObtenerMenuxRol] 
	-- Add the parameters for the stored procedure here
	@nombreUsuario		VARCHAR(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	m.idMenu,
	m.Descripcion,
	m.URL
	FROM Usuario u INNER JOIN Persona p 
	ON u.idPersona = p.idPersona INNER JOIN MenuXRol mr 
	ON u.idRol = mr.idRol INNER JOIN Menu m ON 
	m.idMenu = mr.idMenu WHERE NombreUsuario = @nombreUsuario
	AND u.Activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_ObtenerUsuario]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <FEB052024>
-- Description:	<OBTIENE LAS CARACTERISTICAS DE UN USUARIO CUANDO SE PROPORCIONA LAS CREDENCIALES CORRECTAS>
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_ObtenerUsuario] 
	-- Add the parameters for the stored procedure here
	@nombreUsuario	VARCHAR(25)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.idPersona, u.idUsuario, p.Nombre+' '+p.Apellido AS NombreCompleto, u.NombreUsuario, u.Clave FROM Usuario u INNER JOIN Persona p ON 
	p.idPersona = u.idPersona 
	WHERE u.NombreUsuario = @nombreUsuario AND u.Activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ATLA_SP_TitularTarjeta]    Script Date: 09/02/2024 06:22:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUDY COLOCHO>
-- Create date: <07022024>
-- Description:	<TITULAR TARJETA>
-- =============================================
CREATE PROCEDURE [dbo].[ATLA_SP_TitularTarjeta] 
	-- Add the parameters for the stored procedure here
	@idPersona		INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	t.idTarjeta,
	p.Nombre +' '+p.Apellido AS Titular,
	t.NumeroTarjeta Tarjeta,
	t.Saldo, 
	t.SaldoDisponible,
	t.LimiteCrediticio
	FROM 
	Tarjeta t INNER JOIN Persona p ON t.idPersona = p.idPersona
	WHERE p.idPersona = @idPersona AND p.Activo = 1
END
GO
