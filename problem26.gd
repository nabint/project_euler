extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var count  = 0
    var req_num 
    for i in range(17,1000):
        if(check_prime(i) == true):
            var temp = find_recurring_len(i)
            if(count < temp[i]):
                count = temp[i]
                req_num = i
    return req_num


func check_prime(n):
    for i in range(2, int(sqrt(n)) + 1):
        if ( n % i == 0):
            return false
    return true

func find_recurring_len(n):
    var numtor = 10
    var rec_digit = ""
    var test_rec_digit = ""
    var add_to_second = false

    if(n >100):
        rec_digit += "00"
        numtor *= 100


    while true:
        if(len(test_rec_digit) == len(rec_digit) and len(rec_digit) != 0):
                return {n:len(rec_digit)}

        else:
            if(add_to_second):
                test_rec_digit += String(numtor/n)
                
                for i in range(len(test_rec_digit)):
                    if( test_rec_digit[i] != rec_digit[i]):
                        add_to_second = false
                        rec_digit += test_rec_digit
                        test_rec_digit = ""
                        break
                
            elif ( len(rec_digit) == 0 ):
                rec_digit += String( numtor / n )
                
            elif ( rec_digit[0] == String(numtor/n)):
                add_to_second = true
                test_rec_digit += String ( numtor / n)

            else:
                rec_digit += String( numtor / n )
            
            if numtor / n <= 0:
                numtor *= 10
            else:
                numtor = ( numtor % n ) * 10


