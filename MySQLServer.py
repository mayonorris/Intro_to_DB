# MySQLServer.py
import mysql.connector

def main():
    connection = None
    cursor = None
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            port=3306,
        )
        cursor = connection.cursor()
        # No SELECT or SHOW statements — create db idempotently
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        connection.commit()
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        print(f"Error: Failed to connect or create database. {err}")
    finally:
        try:
            if cursor is not None:
                cursor.close()
        except Exception:
            pass
        try:
            if connection is not None and connection.is_connected():
                connection.close()
        except Exception:
            pass

if __name__ == "__main__":
    main()
