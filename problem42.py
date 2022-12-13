from datetime import datetime

triangle_nos = [1]

def main():
    start_time = datetime.now()
    ans = my_func()
    dt = datetime.now() - start_time
    ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
    print(f"Ans {ans}, Duration: {ms/1000:.2f}" %  [ans,ms])


def my_func():
    f = open("p042_words.txt","r")
    list_of_alphabets = f.read().replace('"','').split(',')
    populate_triangle_list(max(list_of_alphabets,key=len))
    triangle_count = 0
    for i in list_of_alphabets:
        if(ret_ascii_sum(i) in triangle_nos):
            triangle_count += 1
    return triangle_count


def populate_triangle_list(lon_char):
    n = 1
    next_t = 0
    while next_t < len(lon_char)*26:
        next_t = int(0.5*n*(n+1))
        n+=1
        triangle_nos.append(next_t)


def ret_ascii_sum(word):
    sm = 0
    for i in word:
        sm += ord(i) - 64
    return sm


main()