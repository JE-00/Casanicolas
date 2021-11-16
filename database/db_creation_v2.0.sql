-- Database Casanicolas v2.0

-- CREATE DATABASE casanicolas;
-- USE casanicolas;

CREATE TABLE casanicolas.hist_medico (
    hist_med_ID INT NOT NULL AUTO_INCREMENT,
    estado_emocional VARCHAR(254),

    -- Constraints
    CONSTRAINT PK_Historial_Medico PRIMARY KEY (hist_med_ID)
);

CREATE TABLE casanicolas.cond_medica (
    cond_med_ID INT NOT NULL AUTO_INCREMENT,
    hist_med_ID INT NOT NULL,
    condicion VARCHAR(50),
    cuidados VARCHAR(100),
    tratamiento VARCHAR(100),
    medicamento VARCHAR(100),

    -- Constraints
    CONSTRAINT PK_Condicion_Medica PRIMARY KEY (cond_med_ID),
    CONSTRAINT FK_Condicion_Medica_Historial_Medico FOREIGN KEY (hist_med_ID) REFERENCES casanicolas.hist_medico(hist_med_ID)
);

CREATE TABLE casanicolas.embarazo (
    embarazo_ID INT NOT NULL AUTO_INCREMENT,
    hist_med_ID INT NOT NULL,
    semanas INT,

    -- Constraints
    CONSTRAINT PK_Embarazo PRIMARY KEY (embarazo_ID),
    CONSTRAINT FK_Embarazo_Historial_Medico FOREIGN KEY (hist_med_ID) REFERENCES casanicolas.hist_medico(hist_med_ID)
);

CREATE TABLE casanicolas.hist_casas (
    hist_casas_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Historial_Casas PRIMARY KEY (hist_casas_ID)
);

CREATE TABLE casanicolas.casa (
    casa_ID INT NOT NULL AUTO_INCREMENT,
    hist_casas_ID INT NOT NULL,
    nombre VARCHAR(50),
    fecha_llegada DATE,
    fecha_salida DATE,

    -- Constraints
    CONSTRAINT PK_Casa PRIMARY KEY (casa_ID),
    CONSTRAINT FK_Casa_Historial_Casas FOREIGN KEY (hist_casas_ID) REFERENCES casanicolas.hist_casas(hist_casas_ID)
);

CREATE TABLE casanicolas.incidencias (
    incidencias_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Incidencias PRIMARY KEY (incidencias_ID)
);

CREATE TABLE casanicolas.incidencia (
    incidencia_ID INT NOT NULL AUTO_INCREMENT,
    incidencias_ID INT NOT NULL,
    tipo VARCHAR(30),
    especif VARCHAR(254),
    agresor VARCHAR(254),
    pais VARCHAR(50),
    estado VARCHAR(50),
    ciudad VARCHAR(50),

    -- Constraints
    CONSTRAINT PK_Incidencia PRIMARY KEY (incidencia_ID),
    CONSTRAINT FK_Incidencia_Incidencias FOREIGN KEY (incidencias_ID) REFERENCES casanicolas.incidencias(incidencias_ID)
);

CREATE TABLE casanicolas.viaje (
    viaje_ID INT NOT NULL AUTO_INCREMENT,
    incidencias_ID INT NOT NULL,
    hist_casas_ID INT NOT NULL,
    estado_entrada VARCHAR(50),
    ciudad_entrada VARCHAR(50),
    forma_transporte VARCHAR(50),
    pais_destino VARCHAR(50),
    estado_destino VARCHAR(50),
    ciudad_destino VARCHAR(50),
    estatus_migracion VARCHAR(30),
    deportaciones INT,
    estado_cruce VARCHAR(50),
    ciudad_cruce VARCHAR(50),

    -- Constraints
    CONSTRAINT PK_Viaje PRIMARY KEY (viaje_ID),
    CONSTRAINT FK_Viaje_Incidencias FOREIGN KEY (incidencias_ID) REFERENCES casanicolas.incidencias(incidencias_ID),
    CONSTRAINT FK_Viaje_Historial_Casas FOREIGN KEY (hist_casas_ID) REFERENCES casanicolas.hist_casas(hist_casas_ID)
);

CREATE TABLE casanicolas.origen (
    origen_ID INT NOT NULL AUTO_INCREMENT,
    viaje_ID INT NOT NULL,
    pais VARCHAR(50),
    estado VARCHAR(50),
    ciudad VARCHAR(50),
    fecha_salida DATE,
    motivo_salida VARCHAR(50),
    motivo_especif VARCHAR(254),

    -- Constraints
    CONSTRAINT PK_Origen PRIMARY KEY (origen_ID),
    CONSTRAINT FK_Origen_Viaje FOREIGN KEY (viaje_ID) REFERENCES casanicolas.viaje(viaje_ID)
);

CREATE TABLE casanicolas.conexiones (
    conexiones_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Conexiones PRIMARY KEY (conexiones_ID)
);

CREATE TABLE casanicolas.conexion (
    conexion_ID INT NOT NULL AUTO_INCREMENT,
    conexiones_ID INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido_p VARCHAR(30),
    apellido_m VARCHAR(30),
    relacion VARCHAR(30),
    num_tel VARCHAR(15),
    nacionalidad VARCHAR(50),

    -- Constraints
    CONSTRAINT PK_Conexion PRIMARY KEY (conexion_ID),
    CONSTRAINT FK_Conexion_Conexiones FOREIGN KEY (conexiones_ID) REFERENCES casanicolas.conexiones(conexiones_ID)
);

CREATE TABLE casanicolas.conexion_conf (
    conexion_conf_ID INT NOT NULL AUTO_INCREMENT,
    conexiones_ID INT NOT NULL,
    nombre VARCHAR(30),
    apellido_p VARCHAR(30),
    apellido_m VARCHAR(30),
    relacion VARCHAR(30),
    num_tel VARCHAR(15),
    nacionalidad VARCHAR(50),

    -- Constraints
    CONSTRAINT PK_Conexion_Confiable PRIMARY KEY (conexion_conf_ID),
    CONSTRAINT FK_Conexion_Confiable_Conexiones FOREIGN KEY (conexiones_ID) REFERENCES casanicolas.conexiones(conexiones_ID)
);

CREATE TABLE casanicolas.familia (
    familia_ID INT NOT NULL AUTO_INCREMENT,
    hijos INT,

    -- Constraints
    CONSTRAINT PK_Familia PRIMARY KEY (familia_ID)
);

CREATE TABLE casanicolas.familiar (
    familiar_ID INT NOT NULL AUTO_INCREMENT,
    familia_ID INT NOT NULL,
    acompaniante INT,
    nombre VARCHAR(50) NOT NULL,
    apellido_p VARCHAR(30),
    apellido_m VARCHAR(30),
    relacion VARCHAR(30),
    num_tel VARCHAR(15),
    nacionalidad VARCHAR(50),

    -- Constraints
    CONSTRAINT PK_Familiar PRIMARY KEY (familiar_ID),
    CONSTRAINT FK_Familiar_Familia FOREIGN KEY (familia_ID) REFERENCES casanicolas.familia(familia_ID)
);

CREATE TABLE casanicolas.relaciones (
    relac_ID INT NOT NULL AUTO_INCREMENT,
    familia_ID INT NOT NULL,
    conexiones_ID INT NOT NULL,
    estado_civil VARCHAR(30),
    grupo_etnico VARCHAR(30),
    dependientes INT,

    -- Constraints
    CONSTRAINT PK_Relaciones PRIMARY KEY (relac_ID),
    CONSTRAINT FK_Relaciones_Familia FOREIGN KEY (familia_ID) REFERENCES casanicolas.familia(familia_ID),
    CONSTRAINT FK_Relaciones_Conexiones FOREIGN KEY (conexiones_ID) REFERENCES casanicolas.conexiones(conexiones_ID)
);

CREATE TABLE casanicolas.identificacion (
    identif_ID INT NOT NULL AUTO_INCREMENT,
    doc_identif VARCHAR(50),
    num_doc_identif INT,

    -- Constraints
    CONSTRAINT PK_Identificacion PRIMARY KEY (identif_ID)
);

CREATE TABLE casanicolas.contacto (
    contacto_ID INT NOT NULL,
    lada VARCHAR(5),
    num_tel VARCHAR(15),
    duenio_num VARCHAR(50),
    modelo_cel VARCHAR(50),
    email VARCHAR(30),

    -- Constraints
    CONSTRAINT PK_Contacto PRIMARY KEY (contacto_ID)
);

CREATE TABLE casanicolas.datos_personales (
    datos_pers_ID INT NOT NULL AUTO_INCREMENT,
    origen_ID INT NOT NULL,
    relac_ID INT NOT NULL,
    hist_med_ID INT NOT NULL,
    fecha_nacimiento DATE,
    sexo VARCHAR(30),
    genero VARCHAR(30),
    fotografia BLOB,
    senia_particular VARCHAR(30),
    senia_part_especif VARCHAR(30),
    idioma VARCHAR(30),
    otro_idioma VARCHAR(30),
    grado_estudios VARCHAR(30),
    oficio VARCHAR(30),
    ocupacion_orig VARCHAR(50),
    empleo_activo VARCHAR(30),
    empleo_act_especif VARCHAR(100),
    religion VARCHAR(30),

    -- Constraints
    CONSTRAINT PK_Datos_Personales PRIMARY KEY (datos_pers_ID),
    CONSTRAINT FK_Datos_Personales_Origen FOREIGN KEY (origen_ID) REFERENCES casanicolas.origen(origen_ID),
    CONSTRAINT FK_Datos_Personales_Relaciones FOREIGN KEY (relac_ID) REFERENCES casanicolas.relaciones(relac_ID),
    CONSTRAINT FK_Datos_Personales_Historial_Medico FOREIGN KEY (hist_med_ID) REFERENCES casanicolas.hist_medico(hist_med_ID)
);

CREATE TABLE casanicolas.datos_basicos (
    datos_basicos_ID INT NOT NULL AUTO_INCREMENT,
    datos_pers_ID INT NOT NULL,
    contacto_ID INT NOT NULL,
    identif_ID INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido_p VARCHAR(30),
    apellido_m VARCHAR(30),
    alias VARCHAR(30),
    edad INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Datos_Basicos PRIMARY KEY (datos_basicos_ID),
    CONSTRAINT FK_Datos_Basicos_Datos_Personales FOREIGN KEY (datos_pers_ID) REFERENCES casanicolas.datos_personales(datos_pers_ID),
    CONSTRAINT FK_Datos_Basicos_Contacto FOREIGN KEY (contacto_ID) REFERENCES casanicolas.contacto(contacto_ID),
    CONSTRAINT FK_Datos_Basicos_Identificacion FOREIGN KEY (identif_ID) REFERENCES casanicolas.identificacion(identif_ID)
);

CREATE TABLE casanicolas.user (
    user_ID INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(30),
    contrasenia VARCHAR(30),
    user_type INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_User PRIMARY KEY (user_ID)
);

CREATE TABLE casanicolas.hist_registros (
    hist_registros_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Hist_Registros PRIMARY KEY (hist_registros_ID)
);

CREATE TABLE casanicolas.registro (
    registro_ID INT NOT NULL AUTO_INCREMENT,
    user_ID INT NOT NULL,
    hist_registros_ID INT NOT NULL,
    datos_basicos_ID INT NOT NULL,
    fecha_modif DATE,
    hora_modif TIME,
    validacion INT NOT NULL DEFAULT 0,

    -- Constraints
    CONSTRAINT PK_Registro PRIMARY KEY (registro_ID),
    CONSTRAINT FK_Registro_User FOREIGN KEY (user_ID) REFERENCES casanicolas.user(user_ID),
    CONSTRAINT FK_Registro_Historial_Registros FOREIGN KEY (hist_registros_ID) REFERENCES casanicolas.hist_registros(hist_registros_ID),
    CONSTRAINT FK_Registro_Datos_Basicos FOREIGN KEY (datos_basicos_ID) REFERENCES casanicolas.datos_basicos(datos_basicos_ID)
);

CREATE TABLE casanicolas.hist_alertas (
    hist_alertas_ID INT NOT NULL AUTO_INCREMENT,

    -- Constraints
    CONSTRAINT PK_Hist_Alertas PRIMARY KEY (hist_alertas_ID)
);

CREATE TABLE casanicolas.alerta (
    alerta_ID INT NOT NULL AUTO_INCREMENT,
    hist_alertas_ID INT NOT NULL,
    codigo VARCHAR(10),
    descripcion VARCHAR(100),

    -- Constraints
    CONSTRAINT PK_Alerta PRIMARY KEY (alerta_ID),
    CONSTRAINT FK_Alerta_Hist_Alertas FOREIGN KEY (hist_alertas_ID) REFERENCES casanicolas.hist_alertas(hist_alertas_ID)
);

CREATE TABLE casanicolas.migrante (
    -- Attributes
    ID INT NOT NULL AUTO_INCREMENT,
    hist_alertas_ID INT NOT NULL,
    hist_registros_ID INT NOT NULL,

    -- Constraints
    CONSTRAINT PK_Migrante PRIMARY KEY (ID),
    CONSTRAINT FK_Migrante_Hist_Alertas FOREIGN KEY (hist_alertas_ID) REFERENCES casanicolas.hist_alertas(hist_alertas_ID),
	CONSTRAINT FK_Migrante_Hist_Registros FOREIGN KEY (hist_registros_ID) REFERENCES casanicolas.hist_registros(hist_registros_ID)
);
