CREATE DATABASE CRUD_Clientes
USE CRUD_Clientes

CREATE TABLE [dbo].[Clientes](
	[Cliente] [int] NOT NULL,
	[Nombre_Cliente] [varchar](150) NULL,
	[Direccion] [varchar](50) NULL, 
	CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cabeza_Factura](
	[Numero] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Cliente] [int] NOT NULL,
	[Nombre_Cliente] [numeric](15,2) NULL,
	[Direccion] [varchar](50) NULL, 
	CONSTRAINT [PK_Cabeza_Factura] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cabeza_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Cabeza_Factura_Clientes] FOREIGN KEY([Cliente])
REFERENCES [dbo].[Clientes] ([Cliente])
GO

ALTER TABLE [dbo].[Cabeza_Factura] CHECK CONSTRAINT [FK_Cabeza_Factura_Clientes]
GO

CREATE TABLE [dbo].[Productos](
	[Producto] [int] NOT NULL,
	[Nombre_Producto] [varchar](50) NULL, 
	[Valor] [numeric](15,2) NULL,
	CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Detalle_Factura](
	[Numero] [int] NOT NULL,
	[Producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Valor] [numeric](15,2) NULL,
	CONSTRAINT [PK_Detalle_Factura] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC,
	[Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Detalle_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Factura_Productos] FOREIGN KEY([Producto])
REFERENCES [dbo].[Productos] ([Producto])
GO

ALTER TABLE [dbo].[Detalle_Factura] CHECK CONSTRAINT [FK_Detalle_Factura_Productos]
GO