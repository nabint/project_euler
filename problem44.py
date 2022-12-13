from datetime import datetime

def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    n = 2
    pent_list = [1]
    pent_list2 = [5]
    next_loop_count = 1
    temp_n = n

    while True:

        pent_num = int(n*(3*n-1)/2)
        pent_list.append(pent_num)
        n += 1

        while (pent_list[-1] + pent_list[-2]) > pent_list2[-1]:
            temp_num = int( temp_n*(3*temp_n-1)/2 )
            pent_list2.append(temp_num)
            temp_n += 1

        for i in range(len(pent_list)-1):
            if ( pent_list[next_loop_count] - pent_list[i] in pent_list):
                a = pent_list[i] + pent_list[next_loop_count]
                if ( a in pent_list or a in pent_list2):
                    return pent_list[next_loop_count] - pent_list[i]

        next_loop_count += 1


main()
