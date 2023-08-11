import os
import logging

LOG_FTM: str = "[%(asctime)s] %(levelname)s [%(name)s.%(funcName)s:%(lineno)d] %(message)s"
DATE_FTM: str = "%d/%B/%Y %H:%M:%S"


def get_my_env_var(var_name: str) -> str:
    try:
        return os.environ[var_name]
    except KeyError as e:
        raise MissingEnvironmentVariable(f"{var_name} does not exist") from e


def get_file_handler(name: str) -> logging.FileHandler:
    log_dir_name: str = f"{os.getcwd()}/logging"
    if not os.path.exists(log_dir_name):
        os.mkdir(log_dir_name)
    file_handler: logging.FileHandler = logging.FileHandler(f"{log_dir_name}/{name}.log")
    file_handler.setFormatter(logging.Formatter(LOG_FTM, datefmt=DATE_FTM))
    return file_handler


def get_logger(name: str) -> logging.getLogger:
    logger: logging.getLogger = logging.getLogger(name)
    if logger.hasHandlers():
        logger.handlers.clear()
    logger.addHandler(get_file_handler(name))
    logger.setLevel(logging.INFO)
    return logger


class MissingEnvironmentVariable(Exception):
    pass
