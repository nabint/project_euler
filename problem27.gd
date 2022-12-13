extends SceneTree
var prime_list = []

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var count = 0
    var prod = 1
    
    for i in range(1000):
            if check_prime(i):
                prime_list.append(i)
    
    for j in prime_list:
        for k in prime_list:
            var res = get_prime_count(j,k)
            if( res["count"] > count):
                count = res["count"]
                prod = res["prod"]
              
    return prod




func get_prime_count(a,b):
    var i = 0
    var count = 0
    var prod = 1
    var signed_a = a 
    var signed_b = b

    var temp_count = 0
    for j in range(0,4):
        
        temp_count = 0
        i = 0
        
        if(j == 1):
            signed_a = -a
        
        elif(j == 2):
            signed_b = -b

        elif(j == 3):
            signed_a = -a
            signed_b = -b

        while true:
            var reslt = i * i + signed_a * i + signed_b
            if(reslt < 0):
                reslt *= -1
            
            if(check_prime(reslt) == false):
                break
            else:
                
                temp_count += 1
        
            i += 1

        if(temp_count > count):
            count = temp_count
            prod = signed_a * signed_b
            

    return {"count":count,
            "prod":prod,
            }

func check_prime(n):
    var sq = int(sqrt(n)) + 1
    for i in range(2, sq):
        if ( n % i == 0):
            return false
    return true