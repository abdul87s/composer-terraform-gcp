from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def hello_world():
    print("Hello from example_dag_1!")

with DAG(
    'example_dag_1',
    start_date=datetime(2025, 1, 1),
    schedule_interval='@daily',
    catchup=False
) as dag:
    task_hello = PythonOperator(
        task_id='say_hello',
        python_callable=hello_world
    )