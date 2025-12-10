import duckdb
from constants import DB_PATH

username = input("Enter username: ")
password = input("Enter password: ")

with duckdb.connect(str(DB_PATH)) as conn:
    result = conn.execute(" SELECT * FROM users WHERE username = ? AND password = ?", parameters=(username, password))
    # protects against SQL injections
    # the firt parameter responds to the first ?
    if result.fetchall():
        print("You can eat all the ice cream you want")
    else:
        print("Sorry dude")

    # a' OR '1'='1' --
    # WHERE username ='a' OR '1'='1' -- AND password = ... 
    # False or True  -> True

    # ';DROP TABLE users; -- 
    # Destroys the database table