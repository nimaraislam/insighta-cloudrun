FROM python:3.11-slim

#Set working directory
WORKDIR /app

#Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Copy the rest of the application code
COPY app.py .

#Expose the port (Cloud run defaults to 8080)
EXPOSE 8080

#Use gunicorn to run the app in production
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "1", "--threads", "8", "app:app"]