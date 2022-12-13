extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(600851475143)
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f sec" %  [ans,float(duration)/1000.0])
    quit()

func main(n):
    for i in range(sqrt(n)+1, 2, -1):
        if ( n % i == 0):
            if(check_prime(i)):
                return i

func check_prime(n):
    var sq = int(sqrt(n)) + 1
    for i in range(2, sq):
        if ( n % i == 0):
            return false
    return true