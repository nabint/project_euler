from datetime import datetime
import math

def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    first_num = 1

    while True:
        first_num += 1
        second_num = first_num + 1
        third_num = second_num + 1
        fourth_num = third_num + 1

        first_num_set = get_prime_factors(first_num)
        second_num_set = get_prime_factors(second_num)
        third_num_set = get_prime_factors(third_num)
        fourth_num_set = get_prime_factors(fourth_num)

        if( is_consecutive_prime(first_num_set, second_num_set, third_num_set, fourth_num_set) == True):
            return first_num


def is_consecutive_prime(a, b, c, d):
    if(len(a) >= 4 and len(b) >= 4 and len(c) >= 4 and len(d) >= 4):
        return True
    return False


def get_prime_factors(n):
    prime_facts = []
    for i in range(2, int(math.sqrt(n))+1):
        if( n % i == 0 ):
            fact1 = i
            fact2 = int(n / i)
            if(check_prime(fact1) == True):
                prime_facts.append(fact1)
            if(check_prime(fact2) == True):
                prime_facts.append(fact2)

    return list(set(prime_facts))


def check_prime(n):
    sq = int(math.sqrt(n)) + 1
    for i in range(2, sq):
        if ( n % i == 0):
            return False
    return True


main()