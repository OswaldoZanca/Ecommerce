FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

RUN apt-get update && apt-get install -y gcc libpq-dev netcat && apt-get clean

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x scripts/wait_for_db.sh

CMD ["scripts/wait_for_db.sh", "python", "ecommerce/manage.py", "runserver", "0.0.0.0:8000"]
