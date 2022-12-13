from datetime import datetime
import math

def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    prime_list = []

    for i in range(999,10001,2):
        if(check_prime(i)):
            prime_list.append(i)

    for i in range(0,len(prime_list)):
        if(prime_list[i] == 1487 ):
            continue

        for j in range(i+1,len(prime_list)):
            if( sorted (str(prime_list[i])) == sorted(str(prime_list[j]))):
                if (prime_list[j] - prime_list[i] == 3330):
                    for k in range(j+1,len(prime_list)):
                        if( sorted (str(prime_list[i])) == sorted(str(prime_list[j]))):
                            if(prime_list[k]-prime_list[j] == 3330):
                                return str(prime_list[i])+str(prime_list[j])+str(prime_list[k])


def check_prime(n):
    sq = int(math.sqrt(n)) + 1
    for i in range(2, sq):
        if ( n % i == 0):
            return False
    return True


main()