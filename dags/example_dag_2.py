from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    'example_dag_2',
    start_date=datetime(2025, 1, 1),
    schedule_interval='@hourly',
    catchup=False
) as dag:
    task_echo = BashOperator(
        task_id='echo_date',
        bash_command='date'
    )