import cx_Oracle

username = "MYONLINEEDU"
password = "qazedc123"
database = "localhost/xe"
connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()

print("Suicide by year")
query1 = """
SELECT s_year AS year, COUNT(suicide_id) AS num_suicide FROM suicide
GROUP BY s_year
ORDER BY s_year;
"""
cursor.execute(query1)

for row in cursor:
	print(row)


print()
print("Suicide by age category")
query2 = """
SELECT * FROM (
    SELECT human.age AS age_group, COUNT(suicide.suicide_id) AS num_suicide FROM suicide
        JOIN human ON suicide.human_id = human.human_id
    GROUP BY human.age
    ORDER BY num_suicide DESC
) 
"""
cursor.execute(query2)

for row in cursor:
	print(row)

print()
print("top 10 suicide causes")
query3 = """ 
SELECT * FROM (
    SELECT cause.cause_name, COUNT(suicide.suicide_id) AS num_suicide FROM suicide
        JOIN cause ON suicide.cause_name = cause.cause_name
    GROUP BY cause.cause_name
    ORDER BY num_suicide DESC
) WHERE ROWNUM <= 10
"""

cursor.execute(query3)

for row in cursor:
	print(row)