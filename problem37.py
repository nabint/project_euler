from datetime import datetime
from hashlib import new
import time
import math

def main():
    start_time = datetime.now() 
    ans = my_func()
    dt = datetime.now() - start_time 
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    count = 0
    sm_of_num = 0 
    current_no = 11
    is_truncatable = True

    while count < 11:
        is_truncatable = True
        if(check_prime(current_no)):
            new_num = str(current_no)
            
            for i in range(len(str(current_no))-1):
                
                new_num = new_num[:-1]
                
                if(check_prime(int(new_num))==False or new_num=="1"):
                    is_truncatable = False
                    break
            
            if(is_truncatable):
                new_num = str(current_no)
                for i in range(len(str(current_no))-1):
                    new_num = new_num[1:]
                    
                    if(check_prime(int(new_num))==False or new_num=="1"):
                        is_truncatable = False
                        break

            if(is_truncatable):
                sm_of_num += current_no
                count += 1
                print("trunc",current_no)
    
        current_no += 1
    return sm_of_num

def check_prime(n):
    sq = int(math.sqrt(n)) + 1
    for i in range(2,sq):
        if ( n % i == 0):
            return False
    return True

main()