extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(10001)
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()
func main(nth_prime):
    var count = 0
    var i = 1
    var max_prime = 0
    while true:
        i+=1
        if(count == nth_prime):
            return max_prime
        if(check_prime(i)):
            count+= 1
            max_prime = i
        
        
func check_prime(n):
    var sq = int(sqrt(n)) + 1
    for i in range(2, sq):
        if ( n % i == 0):
            return false
    return true