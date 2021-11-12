/*
CRATE DATABASE Casanicolas;
USE Casanicolas;
*/

CREATE TABLE test.hist_medico (
    hist_med_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Historial_Medico PRIMARY KEY (hist_med_ID)
);

CREATE TABLE test.embarazo (
    embarazo_ID INT NOT NULL AUTO_INCREMENT,
    meses INT,
    hist_med_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Embarazo PRIMARY KEY (embarazo_ID),
    CONSTRAINT FK_Embarazo_Historial_Medico FOREIGN KEY (hist_med_ID) REFERENCES test.hist_medico(hist_med_ID)
);

CREATE TABLE test.cond_medica (
    cond_med_ID INT NOT NULL AUTO_INCREMENT,
    condicion VARCHAR(50),
    cuidados VARCHAR(100),
    tratamiento VARCHAR(100),
    medicamento VARCHAR(100),
    hist_med_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Condicion_Medica PRIMARY KEY (cond_med_ID),
    CONSTRAINT FK_Condicion_Medica_Historial_Medico FOREIGN KEY (hist_med_ID) REFERENCES test.hist_medico(hist_med_ID)
);

CREATE TABLE test.conexiones (
    conexiones_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Conexiones PRIMARY KEY (conexiones_ID)
);

CREATE TABLE test.relaciones (
    relac_ID INT NOT NULL AUTO_INCREMENT,
    estado_civil VARCHAR(30),
    grupo_etnico VARCHAR(30),
    hijos INT,
    dependientes INT,
    conexiones_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Relaciones PRIMARY KEY (relac_ID),
    CONSTRAINT FK_Relaciones_Conexiones FOREIGN KEY (conexiones_ID) REFERENCES test.conexiones(conexiones_ID)
);

CREATE TABLE test.conexion (
    conexion_ID INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido_p VARCHAR(30),
    apellido_m VARCHAR(30),
    telefono VARCHAR(15),
    nacionalidad VARCHAR(50),
    conexiones_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Conexion PRIMARY KEY (conexion_ID),
    CONSTRAINT FK_Conexion_Conexiones FOREIGN KEY (conexiones_ID) REFERENCES test.conexiones(conexiones_ID)
);

CREATE TABLE test.conexion_confiable (
    conexion_confiable_ID INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    apellido_p VARCHAR(30),
    apellido_m VARCHAR(30),
    relacion VARCHAR(30),
    telefono VARCHAR(15),
    conexiones_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Conexion_Confiable PRIMARY KEY (conexion_confiable_ID),
    CONSTRAINT FK_Conexion_Confiable_Conexiones FOREIGN KEY (conexiones_ID) REFERENCES test.conexiones(conexiones_ID)
);

CREATE TABLE test.contacto (
    contacto_ID INT NOT NULL,
    telefono VARCHAR(15),
    modelo_celular VARCHAR(30),
    duenio_tel VARCHAR(50),
    email VARCHAR(30),

    -- Constraints
    CONSTRAINT PK_Contacto PRIMARY KEY (contacto_ID)
);

CREATE TABLE test.identificacion (
    identif_ID INT NOT NULL AUTO_INCREMENT,
    doc_identif VARCHAR(50),
    num_doc_identif INT,

    -- Constraints
    CONSTRAINT PK_Identificacion PRIMARY KEY (identif_ID)
);

CREATE TABLE test.hist_casas (
    hist_casas_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Historial_Casas PRIMARY KEY (hist_casas_ID)
);

CREATE TABLE test.casa (
    casa_ID INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    fecha_llegada DATE,
    fecha_salida DATE,
    hist_casas_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Casa PRIMARY KEY (casa_ID),
    CONSTRAINT FK_Casa_Historial_Casas FOREIGN KEY (hist_casas_ID) REFERENCES test.hist_casas(hist_casas_ID)
);

CREATE TABLE test.viaje (
    viaje_ID INT NOT NULL AUTO_INCREMENT,
    pais_destino VARCHAR(50),
    estado_destino VARCHAR(50),
    municipio_destino VARCHAR(50),
    motivo_salida VARCHAR(50),
    motivo_especif VARCHAR(254),
    estatus_migracion VARCHAR(30),
    estado_cruce VARCHAR(50),
    municipio_cruce VARCHAR(50),
    deportaciones INT,
    hist_casas_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Viaje PRIMARY KEY (viaje_ID),
    CONSTRAINT FK_Viaje_Historial_Casas FOREIGN KEY (hist_casas_ID) REFERENCES test.hist_casas(hist_casas_ID)
);

CREATE TABLE test.origen (
    origen_ID INT NOT NULL AUTO_INCREMENT,
    pais VARCHAR(50),
    estado VARCHAR(50),
    ciudad VARCHAR(50),
    datos_ID INT NOT NULL,
    viaje_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Origen PRIMARY KEY (origen_ID),
    CONSTRAINT FK_Origen_Viaje FOREIGN KEY (viaje_ID) REFERENCES test.viaje(viaje_ID)
);

CREATE TABLE test.incidencia (
    incidencia_ID INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(10),
    descripcion VARCHAR(100),
    ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Incidencia PRIMARY KEY (incidencia_ID)
);

CREATE TABLE test.datos_personales (
    datos_ID INT NOT NULL AUTO_INCREMENT,
    alias VARCHAR(30),
    genero VARCHAR(30),
    fecha_nacimiento DATE,
    fotografia BLOB,
    grado_estudios VARCHAR(30),
    oficio VARCHAR(30),
    religion VARCHAR(30),
    idioma VARCHAR(30),
    otro_idioma VARCHAR(30),
    actividad_prep VARCHAR(50),
    origen_ID INT NOT NULL,
    identif_ID INT NOT NULL,
    contacto_ID INT NOT NULL,
    relac_ID INT NOT NULL,
    hist_med_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Datos_Personales PRIMARY KEY (datos_ID),
    CONSTRAINT FK_Datos_Personales_Origen FOREIGN KEY (origen_ID) REFERENCES test.origen(origen_ID),
    CONSTRAINT FK_Datos_Personales_Ideficacion FOREIGN KEY (identif_ID) REFERENCES test.identificacion(identif_ID),
    CONSTRAINT FK_Datos_Personales_Contacto FOREIGN KEY (contacto_ID) REFERENCES test.contacto(contacto_ID),
    CONSTRAINT FK_Datos_Personales_Relaciones FOREIGN KEY (relac_ID) REFERENCES test.relaciones(relac_ID),
    CONSTRAINT FK_Datos_Personales_Historial_Medico FOREIGN KEY (hist_med_ID) REFERENCES test.hist_medico(hist_med_ID)
);

CREATE TABLE test.migrante (
    -- Attributes
    ID INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido_p VARCHAR(30),
    apellido_m VARCHAR(30),
    edad INT NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    fecha_registro DATE,
    validacion INT NOT NULL DEFAULT 0,
    incidencia_ID INT NOT NULL,
    datos_ID INT NOT NULL,


    -- Constraints
    CONSTRAINT PK_Migrante PRIMARY KEY (ID),
    CONSTRAINT FK_Migrante_Incidencia FOREIGN KEY (incidencia_ID) REFERENCES test.incidencia(incidencia_ID),
	CONSTRAINT FK_Migrante_Datos_Personales FOREIGN KEY (datos_ID) REFERENCES test.datos_personales(datos_ID)
);

CREATE TABLE test.user (
    user_ID INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(30),
    contrasenia VARCHAR(30),
    user_type INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_User PRIMARY KEY (user_ID)
);
