FROM python:3.9
RUN adduser --system --no-create-home nonroot

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./main.py /code/

USER nonroot

EXPOSE  8080

#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

# If running behind a proxy like Nginx or Traefik add --proxy-headers
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--proxy-headers"]
