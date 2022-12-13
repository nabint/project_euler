extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(20)
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f sec" %  [ans,float(duration)/1000])
    quit()

func main(max_num):
    var max_prime = get_max_prime(max_num)
    var candidate = 0
    while true:
        candidate += max_num
        if (candidate % max_prime != 0 ):
            continue
        elif (is_divisible(candidate, max_num)):
            return candidate

func get_max_prime(nums):
    var max_prime = 0
    var candidate = 2
    while (candidate != nums):
        if check_prime(candidate):
            max_prime = candidate
        candidate+=1
    return max_prime

func check_prime(n):
    var sq = int(sqrt(n)) + 1
    for candidate in range(2, sq):
        if (n % candidate == 0):
            return false
    return true


func is_divisible(n, max_num):
    for candidate in range( 3,max_num ):
        if (n % candidate != 0):
            return false
    return true