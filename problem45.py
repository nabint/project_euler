from datetime import datetime

def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    triangle_n = 1
    pent_n = 1
    hex_n = 1

    current_hex = 1
    current_pent = 1

    while triangle_n:

        triangle_n+=1
        tn = get_triangle_n(triangle_n)

        while tn > current_pent:
            current_pent = get_pent_n(pent_n)
            pent_n += 1

        while tn > current_hex:
            current_hex = get_hex_n(hex_n)
            hex_n += 1

        if(tn == current_hex and tn == current_pent):
            if(tn != 40755):
                return tn


def get_triangle_n(n):
    return int(n*(n+1)/2)

def get_pent_n(n):
    return int(n*(3*n-1)/2)

def get_hex_n(n):
    return int(n*(2*n -1))

main()