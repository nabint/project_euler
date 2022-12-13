from datetime import datetime
from re import L
import time


def main():
    start_time = datetime.now() 
    ans = my_func()
    dt = datetime.now() - start_time 
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    max_pand = 0
    for i in range(1,100000):
        p_mult = is_pandigital_mul(i)
        if(p_mult):
            if(int(p_mult) > max_pand):
                max_pand = int(p_mult)
    return max_pand


def is_pandigital_mul(n):

    sm = ""
    mult_fac = 1

    while len(sm) < 9:
        prd = n * mult_fac
        sm += str(prd)
        mult_fac += 1

    if(len(sm) > 9 or mult_fac < 2 or "0" in sm):
        return False

    else:
        if (check_pandigital(sm)):
            return sm


def check_pandigital(reslt):
    for i in range(0,len(reslt)):
        for j in range(i+1,len(reslt)):
            if reslt[i] == reslt[j]:
                return False
    return True

main()