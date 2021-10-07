import mysql
import csv

mydb = MySQLdb.connect(host="127.0.0.1", user="root", password="", databases="all_db")

with open('Registro1.csv') as csv_file:
    csvfile = csv.reader(csv_file, delimeter=',')
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2])
        all_values.append(value)

# Num,Id,Nombre,Apellido Paterno,Apellido Materno,Alias,Fecha de Nacimiento,url foto,Nacionalidad,Otra Nacionalidad,Nombre Otra Nacionalidad,Alerta,Comentarios,Edad,Menor de Edad Solo,Genero,Otro Genero,Pais,Otro Pais,Estado,Otro Estado,Ciudad,Otra Ciudad,Documento de Identificacion,Otro Documento de Identificacion,# de Documento de Identificacion,Grupo etnico,Grupo etnico Nombre,Estado Civil,Otro Estado Civil,Hijos,Dependientes,Telfono,Celular,Duenio del Telefono,Grado de Estudios,Otro Grado de Estudios,Embarazada,Semanas de Embarazo,Lenguajes,Otros Lenguajes,Pais Destino,Motivos de Salida,Motivo de Salida Especifico,Actividad,Otra Actividad,Estatus de Migracion,Otro Estatus de Migracion,Frontera Norte de Cruce,Otra Frontera Norte de Cruce,Estado Destino,Ha Sido Deportado,Casa,Fecha de Creacion

query = "INSERT INTO `migrantes`(`ID`, `Num`, `ID_REDODEM`, `Nombre`, `Apellido_Paterno`, `Apellido_Materno`, `Alias`, " \
        "`Fecha_Nacimiento`, `url_foto`, `Nacionalidad`, `Otra_Nacionalidad`, `Nombre_Otra_Nacionalidad`, `Alerta`, " \
        "`Comentarios`, `Edad`, `Menor_de_Edad_Solo`, `Genero`, `Otro_Genero`, `Pais`, `Otro_Pais`, `Estado`, " \
        "`Otro_Estado`, `Ciudad`, `Otra_Ciudad`, `Documento_de_Identificacion`, `Otro_Documento_de_Identificacion`, " \
        "`Num_de_Documento_de_Identificacion`, `Grupo_etnico`, `Grupo_etnico_Nombre`, `Estado_Civil`, " \
        "`Otro_Estado_Civil`, `Hijos`, `Dependientes`, `Telfono`, `Celular`, `Duenio_del_Telefono`, " \
        "`Grado_de_Estudios`, `Otro_Grado_de_Estudios`, `Embarazada`, `Semanas_de_Embarazo`, `Lenguajes`, " \
        "`Otros_Lenguajes`, `Pais_Destino`, `Motivos_de_Salida`, `Motivo_de_Salida_Especifico`, `Actividad`, " \
        "`Otra_Actividad`, `Estatus_de_Migracion`, `Otro_Estatus_de_Migracion`, `Frontera_Norte_de_Cruce`, " \
        "`Otra_Frontera_Norte_de_Cruce`, `Estado_Destino`, `Ha_Sido_Deportado`, `Casa`, `Fecha_de_Creacion`) " \
        "VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]'," \
        "'[value-9]','[value-10]','[value-11]','[value-12]','[value-13]','[value-14]','[value-15]','[value-16]'," \
        "'[value-17]','[value-18]','[value-19]','[value-20]','[value-21]','[value-22]','[value-23]','[value-24]'," \
        "'[value-25]','[value-26]','[value-27]','[value-28]','[value-29]','[value-30]','[value-31]','[value-32]'," \
        "'[value-33]','[value-34]','[value-35]','[value-36]','[value-37]','[value-38]','[value-39]','[value-40]'," \
        "'[value-41]','[value-42]','[value-43]','[value-44]','[value-45]','[value-46]','[value-47]','[value-48]'," \
        "'[value-49]','[value-50]','[value-51]','[value-52]','[value-53]','[value-54]','[value-55]')"

mycursor = mydb.cursor()
mycursor.executemany(query, all_values)
mydb.commit()
