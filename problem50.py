from datetime import datetime
import math

def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    prime_list = [2]
    max_chain = 0
    for i in range(3,100000,2):
        if check_prime(i):
            prime_list.append(i)

    for i in range(0,len(prime_list)):
            temp_sm = prime_list[i]
            temp_count = 1
            j = i
            while temp_sm < prime_list[-1]:
                if(temp_sm in prime_list):
                    if( temp_count > max_chain):
                        max_chain = temp_count
                        req_num = temp_sm
                temp_sm += prime_list[j]
                temp_count += 1


    return req_num

def check_prime(n):
    sq = int(math.sqrt(n)) + 1
    for i in range(2, sq):
        if ( n % i == 0):
            return False
    return True

main()