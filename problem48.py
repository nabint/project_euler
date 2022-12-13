from datetime import datetime

def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    res_sum = 0
    for i in range(1,1001):
        res_sum += calculate_pow(i)
    return str(res_sum)[-10:]


def calculate_pow(num):
    mult = 1
    for i in range(0,num):
        mult *= num
        if(len(str(mult)) > 10):
            mult = int(str(mult)[-10:])

    if(len(str(mult)) > 10):
        return int(str(mult)[-10:])

    return mult


main()