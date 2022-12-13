from datetime import datetime
from tempfile import tempdir
import time


def main():
    start_time = datetime.now() 
    ans = my_func()
    dt = datetime.now() - start_time 
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():

    temp_str = ""
    i = 1
    
    while True:
        temp_str += str(i)
        if(len(temp_str)>1000000):
            break
        i += 1
    
    next_digit = 10
    prod = 1

    for i in range(len(temp_str)):
        if ( (i+1) % next_digit == 0 ):
            next_digit *= 10
            prod *= int(temp_str[i])
    return prod

main()