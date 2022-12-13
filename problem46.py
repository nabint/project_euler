from datetime import datetime
import math
prime_list = [1,2,3]


def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    n = 3
    while True:
        n += 2
        if(check_prime(n)==False):
            if(check_square_rep(n)==False):
                return n
        else:
            prime_list.append(n)


def check_square_rep(n):
    for i in prime_list:
        if (i == 1):
            continue
        for j in range(1,i):
            if(j*j)>n:
                break
            a = i + 2 * (j*j)
            if( a == n ):
                return True
    return False

def check_prime(n):
    sq = int(math.sqrt(n)) + 1
    for i in range(3,sq,2):
        if ( n % i == 0):
            return False
    return True

main()