import uvicorn
from fastapi import Request
from fastapi import FastAPI
from service_inn import ServiceInn


app: FastAPI = FastAPI()


@app.post("/")
async def main(request: Request):
    response = await request.json()
    service_inn: ServiceInn = ServiceInn(response['inn'])
    return service_inn.get_data_by_inn()


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)