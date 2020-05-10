USE [negocio_autospartes]
GO
/****** Object:  Table [dbo].[automoviles]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automoviles](
	[modelo] [varchar](20) NOT NULL,
	[anio] [int] NOT NULL,
	[detalle] [text] NULL,
	[fabricante_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[modelo] ASC,
	[anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[estado] [varchar](15) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[direccion] [varchar](30) NOT NULL,
	[ciudad] [varchar](15) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles](
	[numero_linea] [int] NOT NULL,
	[consecutivo_orden] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[provedor_id] [int] NOT NULL,
	[parte_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[consecutivo_orden] ASC,
	[numero_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[es_parte_de]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[es_parte_de](
	[parte_id] [int] NOT NULL,
	[auto_modelo] [varchar](20) NOT NULL,
	[auto_anio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[parte_id] ASC,
	[auto_modelo] ASC,
	[auto_anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[estado] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fabricantes_autos]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fabricantes_autos](
	[nombre] [varchar](20) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fabricantes_partes]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fabricantes_partes](
	[nombre] [varchar](30) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas_partes]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas_partes](
	[nombre] [varchar](15) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordenes]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenes](
	[consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto_total] [decimal](17, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[organizaciones]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[organizaciones](
	[surrogate_key] [int] NOT NULL,
	[encargado_nombre] [varchar](20) NOT NULL,
	[encargado_telefono] [varchar](9) NOT NULL,
	[encargado_cargo] [varchar](10) NOT NULL,
	[cedula_juridica] [decimal](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula_juridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partes]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partes](
	[nombre] [varchar](30) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[marca_id] [int] NOT NULL,
	[fabricante_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas](
	[cedula] [int] NOT NULL,
	[surrogate_key] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provedores]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provedores](
	[ciudad] [varchar](15) NOT NULL,
	[direccion] [varchar](30) NOT NULL,
	[nombre_contacto] [varchar](20) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveido_por]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveido_por](
	[parte_id] [int] NOT NULL,
	[provedor_id] [int] NOT NULL,
	[precio] [decimal](9, 2) NOT NULL,
	[porcentaje_ganancia] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[parte_id] ASC,
	[provedor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefonos_persona]    Script Date: 10/5/2020 12:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefonos_persona](
	[cedula] [int] NOT NULL,
	[telefono] [varchar](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula] ASC,
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([estado], [nombre], [direccion], [ciudad], [id]) VALUES (N'ACTIVO', N'andresxd', N'direccion', N'ciudaad', 1)
INSERT [dbo].[clientes] ([estado], [nombre], [direccion], [ciudad], [id]) VALUES (N'ACTIVO', N'Carlos Varela', N'Naranjo', N'Naranjo', 2)
INSERT [dbo].[clientes] ([estado], [nombre], [direccion], [ciudad], [id]) VALUES (N'ACTIVO', N'ACME', N'Cartago centro', N'Cartago', 3)
INSERT [dbo].[clientes] ([estado], [nombre], [direccion], [ciudad], [id]) VALUES (N'ACTIVO', N'xd', N'xd', N'xd', 10)
INSERT [dbo].[clientes] ([estado], [nombre], [direccion], [ciudad], [id]) VALUES (N'SUSPENDIDO', N'Edoardo', N'pierson', N'pierson', 11)
SET IDENTITY_INSERT [dbo].[clientes] OFF
INSERT [dbo].[estados] ([estado]) VALUES (N'ACTIVO')
INSERT [dbo].[estados] ([estado]) VALUES (N'INACTIVO')
INSERT [dbo].[estados] ([estado]) VALUES (N'SUSPENDIDO')
SET IDENTITY_INSERT [dbo].[fabricantes_autos] ON 

INSERT [dbo].[fabricantes_autos] ([nombre], [id]) VALUES (N'BMW', 3)
INSERT [dbo].[fabricantes_autos] ([nombre], [id]) VALUES (N'Mazda', 4)
INSERT [dbo].[fabricantes_autos] ([nombre], [id]) VALUES (N'Mitsubishi', 6)
INSERT [dbo].[fabricantes_autos] ([nombre], [id]) VALUES (N'Nissan', 2)
INSERT [dbo].[fabricantes_autos] ([nombre], [id]) VALUES (N'Toyota', 1)
INSERT [dbo].[fabricantes_autos] ([nombre], [id]) VALUES (N'Volkswagen', 5)
SET IDENTITY_INSERT [dbo].[fabricantes_autos] OFF
SET IDENTITY_INSERT [dbo].[fabricantes_partes] ON 

INSERT [dbo].[fabricantes_partes] ([nombre], [id]) VALUES (N'International Spare Parts', 9)
INSERT [dbo].[fabricantes_partes] ([nombre], [id]) VALUES (N'Auto Spare Parts', 10)
INSERT [dbo].[fabricantes_partes] ([nombre], [id]) VALUES (N'AJS Auto Parts', 11)
INSERT [dbo].[fabricantes_partes] ([nombre], [id]) VALUES (N'Discounted Parts', 12)
SET IDENTITY_INSERT [dbo].[fabricantes_partes] OFF
SET IDENTITY_INSERT [dbo].[marcas_partes] ON 

INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Armstrong', 9)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Bondo', 4)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Delphi', 1)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Falken', 2)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Fuller', 8)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Goyo', 5)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Kelly', 3)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Kleber', 7)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Koni', 6)
INSERT [dbo].[marcas_partes] ([nombre], [id]) VALUES (N'Walker', 10)
SET IDENTITY_INSERT [dbo].[marcas_partes] OFF
INSERT [dbo].[organizaciones] ([surrogate_key], [encargado_nombre], [encargado_telefono], [encargado_cargo], [cedula_juridica]) VALUES (3, N'Pepito', N'8888-8888', N'JEFE', CAST(9999999999 AS Decimal(10, 0)))
INSERT [dbo].[personas] ([cedula], [surrogate_key]) VALUES (118050464, 11)
INSERT [dbo].[personas] ([cedula], [surrogate_key]) VALUES (305320241, 1)
INSERT [dbo].[personas] ([cedula], [surrogate_key]) VALUES (333355555, 2)
INSERT [dbo].[personas] ([cedula], [surrogate_key]) VALUES (777777777, 10)
INSERT [dbo].[telefonos_persona] ([cedula], [telefono]) VALUES (305320241, N'8595-7893')
INSERT [dbo].[telefonos_persona] ([cedula], [telefono]) VALUES (305320241, N'8888-8888')
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_NOMBRE_FABRICANTES_AUTOS]    Script Date: 10/5/2020 12:33:22 ******/
ALTER TABLE [dbo].[fabricantes_autos] ADD  CONSTRAINT [AK_NOMBRE_FABRICANTES_AUTOS] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AK_NOMBRE_FABRICANTES_PARTES]    Script Date: 10/5/2020 12:33:22 ******/
ALTER TABLE [dbo].[fabricantes_partes] ADD  CONSTRAINT [AK_NOMBRE_FABRICANTES_PARTES] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_NOMBRE_MARCAS_PARTES]    Script Date: 10/5/2020 12:33:22 ******/
ALTER TABLE [dbo].[marcas_partes] ADD  CONSTRAINT [AK_NOMBRE_MARCAS_PARTES] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_NOMBRE]    Script Date: 10/5/2020 12:33:22 ******/
ALTER TABLE [dbo].[partes] ADD  CONSTRAINT [AK_NOMBRE] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ordenes] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[automoviles]  WITH CHECK ADD FOREIGN KEY([fabricante_id])
REFERENCES [dbo].[fabricantes_autos] ([id])
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD FOREIGN KEY([estado])
REFERENCES [dbo].[estados] ([estado])
GO
ALTER TABLE [dbo].[detalles]  WITH CHECK ADD FOREIGN KEY([consecutivo_orden])
REFERENCES [dbo].[ordenes] ([consecutivo])
GO
ALTER TABLE [dbo].[detalles]  WITH CHECK ADD FOREIGN KEY([parte_id])
REFERENCES [dbo].[partes] ([id])
GO
ALTER TABLE [dbo].[detalles]  WITH CHECK ADD FOREIGN KEY([provedor_id])
REFERENCES [dbo].[provedores] ([id])
GO
ALTER TABLE [dbo].[es_parte_de]  WITH CHECK ADD FOREIGN KEY([parte_id])
REFERENCES [dbo].[partes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[es_parte_de]  WITH CHECK ADD FOREIGN KEY([auto_modelo], [auto_anio])
REFERENCES [dbo].[automoviles] ([modelo], [anio])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[organizaciones]  WITH CHECK ADD FOREIGN KEY([surrogate_key])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[partes]  WITH CHECK ADD FOREIGN KEY([fabricante_id])
REFERENCES [dbo].[fabricantes_partes] ([id])
GO
ALTER TABLE [dbo].[partes]  WITH CHECK ADD FOREIGN KEY([marca_id])
REFERENCES [dbo].[marcas_partes] ([id])
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD FOREIGN KEY([surrogate_key])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[proveido_por]  WITH CHECK ADD FOREIGN KEY([parte_id])
REFERENCES [dbo].[partes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[proveido_por]  WITH CHECK ADD FOREIGN KEY([provedor_id])
REFERENCES [dbo].[provedores] ([id])
GO
ALTER TABLE [dbo].[telefonos_persona]  WITH CHECK ADD FOREIGN KEY([cedula])
REFERENCES [dbo].[personas] ([cedula])
GO
