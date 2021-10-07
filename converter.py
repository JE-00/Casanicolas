import MySQLdb
import csv

mydb = MySQLdb.connect(host="127.0.0.1", user="root", password="", databases="all_db")

with open('Registro1.csv') as csv_file:
    csvfile = csv.reader(csv_file, delimeter=',')
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2])
        all_values.append(value)

# Num,Id,Nombre,Apellido Paterno,Apellido Materno,Alias,Fecha de Nacimiento,url foto,Nacionalidad,Otra Nacionalidad,Nombre Otra Nacionalidad,Alerta,Comentarios,Edad,Menor de Edad Solo,Genero,Otro Genero,Pais,Otro Pais,Estado,Otro Estado,Ciudad,Otra Ciudad,Documento de Identificacion,Otro Documento de Identificacion,# de Documento de Identificacion,Grupo etnico,Grupo etnico Nombre,Estado Civil,Otro Estado Civil,Hijos,Dependientes,Telfono,Celular,Duenio del Telefono,Grado de Estudios,Otro Grado de Estudios,Embarazada,Semanas de Embarazo,Lenguajes,Otros Lenguajes,Pais Destino,Motivos de Salida,Motivo de Salida Especifico,Actividad,Otra Actividad,Estatus de Migracion,Otro Estatus de Migracion,Frontera Norte de Cruce,Otra Frontera Norte de Cruce,Estado Destino,Ha Sido Deportado,Casa,Fecha de Creacion

query = "INSERT INTO 'migrantes' ('nombre', 'company', 'edad', 'nacionalidad') VALUES (%s, %s, %s, %s)"

mycursor = mydb.cursor()
mycursor.executemany(query, all_values)
mydb.commit()
