import csv
import mysql.connector

# Reading
# name of input csv file
INfilename = 'C:/Users/josee/Github_Repos/Casanicolas/reportes/registrocompleto.csv'

# Opening the csv file
with open(INfilename, 'r') as csv_IN_file:
    # Reading the csv file
    csvINfile = csv.reader(csv_IN_file)
    migrante_values = []

    lines_fields = ['Num', 'Id', 'Nombre', 'Apellido Paterno', 'Apellido Materno', 'Alias', 'Fecha de Nacimiento',
                    'url foto', 'Nacionalidad', 'Otra Nacionalidad', 'Nombre Otra Nacionalidad', 'Alerta',
                    'Comentarios', 'Edad', 'Menor de Edad Solo', 'Género', 'Otro Género', 'País', 'Otro País', 'Estado',
                    'Otro Estado', 'Ciudad', 'Otra Ciudad', 'Documento de Identificación',
                    'Otro Documento de Identificación', '# de Documento de Identificación', 'Grupo Étnico',
                    'Grupo Étnico Nombre', 'Estado Civil', 'Otro Estado Civil', 'Hijos', 'Dependientes', 'Teléfono',
                    'Celular', 'Dueño del Teléfono', 'Grado de Estudios', 'Otro Grado de Estudios', 'Embarazada',
                    'Semanas de Embarazo', 'Lenguajes', 'Otros Lenguajes', 'País Destino', 'Motivos de Salida',
                    'Motivo de Salida Específico', 'Actividad', 'Otra Actividad', 'Estatus de Migración',
                    'Otro Estatus de Migración', 'Frontera Norte de Cruce', 'Otra Frontera Norte de Cruce',
                    'Estado Destino', 'Ha Sido Deportado', 'Casa', 'Fecha de Creación']

    # Displaying the contents of the csv file
    for lines in csvINfile:
        migrante_value = (lines[2], lines[3], lines[4], lines[13], lines[8], lines[53]) #, str(i), str(i))
        migrante_values.append(migrante_value)

# Writing
# field names
migrante_fields = ['ID', 'nombre', 'apellido_p', 'apellido_m', 'edad', 'nacionalidad', 'fecha_registro', 'validacion',
                   'incidencia_ID', 'datos_ID']


# data rows of csv file
migrante_rows = migrante_values

# name of output csv file
OUTfilename = 'C:/Users/josee/Github_Repos/Casanicolas/reportes/migrante.csv'

# writing to csv file
with open(OUTfilename, 'w') as csv_OUT_file:
    # creating a csv writer object
    csvwriter = csv.writer(csv_OUT_file)

    # writing the fields
    csvwriter.writerow(migrante_fields)

    # writing the data rows
    csvwriter.writerows(migrante_rows)

conn = mysql.connector.connect(host="localhost", user="root", password="", database="test")

cursor = conn.cursor()

query = "DESC migrante"

cursor.execute(query)

# display all records
table = cursor.fetchall()

# describe table
print('\n Table Description:')
for attr in table:
    print(attr)
