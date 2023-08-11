import time
import httpx
import sqlite3
from __init__ import *
from pathlib import Path
from datetime import datetime
from dotenv import load_dotenv
from dadata.sync import DadataClient

load_dotenv()
logger: logging.getLogger = get_logger(os.path.basename(__file__).replace(".py", "_") + str(datetime.now().date()))


class ServiceInn:

    def __init__(self, inn):
        self.inn = inn
        self.table_name: str = "cache_dadata"
        self.conn: sqlite3.Connection = self.create_file_for_cache()
        self.cur: sqlite3.Cursor = self.load_cache()

    @staticmethod
    def create_file_for_cache():
        """
        Creating a file for recording Dadata caches and sentence
        :return:
        """
        path_cache: str = f"{get_my_env_var('PATH_TO_DB')}/all_data_of_dadata.db"
        fle: Path = Path(path_cache)
        if not os.path.exists(os.path.dirname(fle)):
            os.makedirs(os.path.dirname(fle))
        fle.touch(exist_ok=True)
        return sqlite3.connect(path_cache)

    def load_cache(self) -> sqlite3.Cursor:
        """
        Loading the cache
        :return:
        """
        cur: sqlite3.Cursor = self.conn.cursor()
        cur.execute(f"""CREATE TABLE IF NOT EXISTS {self.table_name}(
                inn TEXT PRIMARY KEY, 
                dadata_data TEXT)
            """)
        self.conn.commit()
        logger.info(f"Cache table {self.table_name} is created")
        return cur

    def cache_add_and_save(self, dadata_data: str) -> None:
        """
        Saving and adding the result to the cache
        :param dadata_data:
        :return:
        """
        self.cur.executemany(f"INSERT or IGNORE INTO {self.table_name} VALUES(?, ?)", [(self.inn, dadata_data)])
        self.conn.commit()
        logger.info(f"Data inserted to cache by inn {self.inn}")

    def get_data_from_service(self):
        """

        :return:
        """
        dadata: DadataClient = DadataClient('3321a7103852f488c92dbbd926b2e554ad63fb49')
        try:
            dadata_response: list = dadata.find_by_id("party", self.inn)
            self.cache_add_and_save(str(dadata_response))
        except httpx.ConnectError as ex_connect:
            logger.error(f"Failed to connect dadata {ex_connect}. Type error is {type(ex_connect)}. INN is {self.inn}")
            time.sleep(30)
            dadata_response = dadata.find_by_id("party", self.inn)
            self.cache_add_and_save(str(dadata_response))
        except Exception as ex_all:
            logger.error(f"Unknown error in dadata {ex_all}. Type error is {type(ex_all)}. INN is {self.inn}")
            dadata_response = []
        return dadata_response

    def get_data_by_inn(self) -> list:
        """

        :return:
        """
        if not (rows := self.cur.execute(f'SELECT * FROM "{self.table_name}" WHERE inn=?', (self.inn,),).fetchall()):
            return self.get_data_from_service()
        logger.info(f"Data getting from cache by inn {self.inn}")
        return eval(rows[0][1])