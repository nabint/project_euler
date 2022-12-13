extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():

    var lst = []

    var count = 0

    var carry = 0
    
    for i in range(2,101):
        
        var savedStr = String(i)

        for k in range(2,101):
            
            if len(savedStr) >= 2:
            
                carry = 0
                
                for j in range (len(savedStr)-1,-1,-1):
                    var temp_sum = 0
                    
                    for z in range(0,i):
                        temp_sum += int(savedStr[j])
                    
                    
                    var added = carry + temp_sum
                    
                    if( added / 10 >= 1 ):
                        
                        carry = added/10
                    
                    
                    else:
                        carry = 0
                    
                    savedStr[j] = String( added % 10 )
                
                if(carry):
                    savedStr = String(carry) + savedStr
                
            else:
                var temp_sum = 0
                
                for z in range(0,i):
                    temp_sum += int(savedStr[0])

                savedStr = String(temp_sum)
                
            if savedStr in lst:
                continue
            else:
                lst.append(savedStr)
                count += 1

    return count


