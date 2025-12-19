# MySQLServer.py
import os
import sys

import mysql.connector
from mysql.connector import Error


def main():
    conn = None
    cur = None
    try:
        conn = mysql.connector.connect(
            host=os.getenv("MYSQL_HOST", "localhost"),
            user=os.getenv("MYSQL_USER", "root"),
            password=os.getenv("MYSQL_PASSWORD", ""),
            port=int(os.getenv("MYSQL_PORT", "3306")),
        )
        cur = conn.cursor()
        # No SELECT/SHOW statements — create database idempotently
        cur.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        conn.commit()
        print("Database 'alx_book_store' created successfully!")
    except Error as e:
        print(f"Error: Failed to connect or create database. {e}")
        sys.exit(1)
    finally:
        try:
            if cur is not None:
                cur.close()
        except Exception:
            pass
        try:
            if conn is not None and conn.is_connected():
                conn.close()
        except Exception:
            pass


if __name__ == "__main__":
    main()
