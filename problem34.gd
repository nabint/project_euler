extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var fact_sum = 0 
    
    for i in range(10,100000):
        var temp_sum = 0
        
        for j in str(i):
            temp_sum += get_fact(int(j))

        if(temp_sum == i):
            fact_sum += i

    return fact_sum


func get_fact(n):
    var prod = 1
    for i in range(1,n+1):
        prod *= i
    return prod

