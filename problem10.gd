extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(2000000)
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main(max_limit):
    var sum = 0
    for i in range( 3 , max_limit,2 ):
        if check_prime(i):
            sum += i           
    return sum + 2


func check_prime(n):
    for i in range(3, int(sqrt(n)) + 1,2):
        if ( n % i == 0):
            return false
    return true