extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(10)
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()


func main(exponents):
    
    var savedStr = "2"
    var carry = 0
    
    for i in range(0,999):
        
        if len(savedStr) >= 2:
            
            carry = 0
            
            for j in range (len(savedStr)-1,-1,-1):
                var added = carry + int(savedStr[j]) + int(savedStr[j])
                if( added / 10 >= 1 ):
                    carry = 1
                else:
                    carry = 0
                savedStr[j] = String( added % 10 )
            
            if(carry):
                savedStr = "1" + savedStr
                
        
        else:
            savedStr = String(int(savedStr[0]) + int(savedStr[0]))
    
    var sum = 0

    for i in range(0,len(savedStr)):
        sum += int(savedStr[i])

    return sum

