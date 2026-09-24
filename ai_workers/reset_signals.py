
import os
from sqlalchemy import create_engine, text
from dotenv import load_dotenv

load_dotenv("C:/laragon/www/cryptrader/.env")

db_path = "C:/laragon/www/cryptrader/database/database.sqlite"
engine = create_engine(f"sqlite:///{db_path}")

with engine.connect() as conn:
    # Reset all failed/processed signals to pending for testing
    result = conn.execute(text("UPDATE signals SET status = 'pending'"))
    conn.commit()
    print(f"Successfully reset signals. They will be re-processed shortly.")
