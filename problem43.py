from datetime import datetime
from turtle import filling


def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    n = 9876543210
    str_n = str(n)
    req_sm = 0

    for ten in str_n:
        new_str = str_n.replace(ten,"")
        if (ten == "0"):
            break
        for ninth in new_str:
            eigth_loop = new_str.replace(ninth,"")
            for eighth in eigth_loop:
                seventh_loop = eigth_loop.replace(eighth,"")
                for seventh in seventh_loop:
                    sixth_loop = seventh_loop.replace(seventh,"")
                    for sixth in sixth_loop:
                        fifth_loop = sixth_loop.replace(sixth,"")
                        for fifth in fifth_loop:
                            fourth_loop = fifth_loop.replace(fifth,"")
                            for fourth in fourth_loop:
                                third_loop = fourth_loop.replace(fourth,"")
                                for third in third_loop:
                                    second_loop = third_loop.replace(third,"")
                                    for second in second_loop:
                                        last_num = second_loop.replace(second,"")
                                        new_nm = ten+ninth+eighth+seventh+sixth+fifth+fourth+third+second+last_num
                                        if(check_divisibility(new_nm)==True):
                                            req_sm += int(new_nm)
    return req_sm


def check_divisibility(str_n):

    divisors = [2,3,5,7,11,13,17]
    for i in range(1,len(str_n)-2):
        nm = int(str_n[i]+str_n[i+1]+str_n[i+2])
        if(nm % divisors[i-1] != 0):
            return False
    return True


main()