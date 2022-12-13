from datetime import datetime
import math
import time


def main():
    start_time = datetime.now() 
    ans = my_func()
    dt = datetime.now() - start_time 
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    max_count = 0
    max_p = 0
    for i in range(2,1001,2):
        no_of_train = get_no_of_trian(i)
        if(no_of_train > max_count):
            max_count = no_of_train
            max_p = i
            
    return max_p



def get_no_of_trian(p):
    count = 0

    for c in range(int(p/2)+1,-1,-1):
        
        if(3 * c - 3 < p):
            break

        for b in range(c-1,1,-1):

            if(c + 2 * b - 1 < p):
                break

            for a in range(b-1,1,-1):
                if(a+b+c < p):
                    break
                
                if(a+b+c == p):
                    if(a*a) + (b*b) == (c*c):
                        count+=1

    return count

main()