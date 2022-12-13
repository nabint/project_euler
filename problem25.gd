extends SceneTree

var fibo = ""


func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()
    
func main():
    print(get_fibo_index(1000))


func get_fibo_index(n):
    var firstNum = "1"
    var secondNum = "1"
    var no_of_digits = 1
    var index_count = 2

    while no_of_digits < n:
        var temp = add_two_num(firstNum,secondNum)
        index_count += 1
        if(len(temp) > len(secondNum)):
            no_of_digits+=1
        firstNum = secondNum
        secondNum = temp
    return index_count



func add_two_num(a,b):
    var added_num = ""
    var carry = 0
    var temp

    for i in range( len(b) - 1, -1, -1 ) :

        if(len(b) > len(a)):
            if(i-1 < 0):
                added_num = String(int(b[i]) + carry) + added_num
            else:
                temp = int( a[i-1] ) + int( b[i] ) + carry
                carry = temp / 10
                added_num = String( temp % 10 ) + added_num

        else:
            temp =  int(a[i]) + int (b[i]) + carry
            carry = temp / 10
            added_num = String( temp % 10 ) + added_num
            if(i == 0 and carry == 1):
                added_num[i] = String(int(added_num[i]) + carry * 10)

    return added_num






    # var index_count 

    # for j in range(0,2):
    #     for i in range(0,4):
    #         index_count += 5
    #         no_of_digits += 1
    #         print("Increase digit ",no_of_digits,"Index ",index_count)
    #         if(no_of_digits == n):
    #             return index_count
        
    #     index_count += 4
    #     no_of_digits += 1
    #     print("Digits ",no_of_digits,"index",index_count)
    #     if(no_of_digits == n):
    #         return index_count

    
    # for i in range(0,3):
    #         index_count += 5
    #         no_of_digits += 1
    #         print("Digits ",no_of_digits,"index",index_count)
    #         if(no_of_digits == n):
    #             print("Equal",index_count)
    #             return index_count

    
    # index_count += 4
    # no_of_digits += 1

    # return index_count


