from datetime import datetime
import math
import time
from unittest import result

def main():
    start_time = datetime.now() 
    ans = my_func()
    dt = datetime.now() - start_time 
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])

def my_func():
    n = 987654321
    
    while True:
        n-=2
        str_n = str(n)

        if "0" in str_n:
            for i in range(0,len(str_n)):
                if(str_n[i] == "0" and i+1<len(str_n)):
                    str_n =  str_n[:i-1]+ str(int(str_n[i-1])-1) + str(9) + str_n[i+1:]
                    n = int(str_n)

        elif(len(set(str_n)) != len(str_n)):
            for i in range(0,len(str_n)):
                for j in range(i+1,len(str_n)):
                    if str_n[i] == str_n[j] and j+1 <len(str_n):
                        str_n = str_n[:j] + str(int(str_n[j])-1) + str_n[j+1:]
                        n = int(str_n)
        else:
            if(check_pandigital(str(n))):
                if(check_prime(n)):
                    return n 
        

def check_prime(n):
    sq = int(math.sqrt(n)) + 1
    for i in range(3,sq,2):
        if ( n % i == 0):
            return False
    return True

def check_pandigital(reslt):
    for i in range(1,len(reslt)+1):
        if(str(i) not in reslt):
            return False

    return True

main()