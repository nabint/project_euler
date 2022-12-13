from datetime import datetime
import time


def main():
    start_time = datetime.now() 
    ans = my_func()
    dt = datetime.now() - start_time 
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    pass

main()