FROM python:3.11-slim
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY requirements.txt .

RUN python -m venv venv

RUN /bin/bash -c "source venv/bin/activate"

# Install specific versions of packages
#RUN pip install random==1.2.3 string==0.1.2
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD [ "uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000" ]

# Install specific versions of packages
#RUN pip install random==1.2.3 string==0.1.2

