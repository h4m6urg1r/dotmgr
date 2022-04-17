"""
l=[1,123,423,54,523,423,54,6,34,134,41,23,4,412,4,35,6,456,532,12]
a=[]
last = -1

def push(num):
    if num%2==0:
        a.append(num)
        last += 1

def pop():
    if last == -1:
        print('Stack is underflow')
    else:
        a.pop(last)
        last -= 1

def display():
    print(a)


for i in l:
    while True:
        print(
            ''' 1. Push
2. Pop
3. Display'''
        )
        stack = int(input('Enter your choice :- '))
        if stack == 1:
            push(i)
            break
        elif stack == 2:
            pop()
        elif stack == 3:
            display()
"""





import mysql.connector as sq
conn=sq.connect(host="localhost",user="root",passwd="root")
cursor=conn.cursor()
def createdatabase():
    # Creating database
    cursor.execute("CREATE DATABASE IF NOT EXISTS prac22")
    print("Database created successfully")
    # Creating table
    cursor.execute("USE prac22")
    cursor.execute("CREATE TABLE IF NOT EXISTS carden(Car_code integer,Carname char(20),Make char(15), Color char(15),capacity integer, charges integer)")
    print ("Table Created")
# Inserting Records in table
def insertrec():
    cursor.execute("insert into carden values(501,'A-star','Suzuki','Red',3,14)")
    cursor.execute("insert into carden values(503,'Indigo','Tata','Silver',3,12)")
    cursor.execute("insert into carden values(510,'C-Class','Mercedes','Red',4,35)")
    conn.commit()
    print(" Records inserted successfuly")
# Showing contents of table
def showallrec():
    cursor.execute("SELECT * FROM carden")
    data=cursor.fetchall()
    for i in data:
        print(i)

# Main block
while True:
    print(" 1. Create database and table", " 2. Insert records in table ", " 3. Display all records", " 4. Exit", sep='\n')
    choice=int(input("Enter your choice"))
    if choice==1:
        createdatabase()
    elif choice==2:
        insertrec()
    elif choice==3:
        showallrec()
    else:
        break
conn.close()
