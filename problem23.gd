extends SceneTree
var even_abundant_numbers = []
var odd_abundant_number = []


func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var sum_abundant = 0
    
    for i in range(1,28123):
        if( i % 2 == 0):
            if is_even_addable_number(i) == false:
                sum_abundant += i
            if(is_abundant(i)):
                even_abundant_numbers.append(i)
        else:
            if is_odd_addable_number(i) == false:
                sum_abundant += i
            if(is_abundant(i)):
                odd_abundant_number.append(i)

    return sum_abundant



func is_even_addable_number(num):
    for i in range(len(even_abundant_numbers)-1,-1,-1):
        if(num - even_abundant_numbers[i]) in even_abundant_numbers:
            return true
    return false


func is_odd_addable_number(num):
    for i in range(len(odd_abundant_number)-1,-1,-1):
        if(num - odd_abundant_number[i]) in even_abundant_numbers:
            return true
    return false

func is_abundant(num):
    var sum = 1
    for i in range(2,sqrt(num)+1):
        if(num % i == 0):
            sum += i
            if(i != num/i):
                sum += (num/i)       
    if(sum > num):
        return true
    return false