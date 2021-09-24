import MySQLdb
import csv

mydb = MySQLdb.connect(host="127.0.0.1", user="root", password="", databases="all_db")

with open('Registro1.csv') as csv_file:
    csvfile = csv.reader(csv_file, delimeter=',')
    all_value = []

