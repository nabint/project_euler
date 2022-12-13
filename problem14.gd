extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(1000000)
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()


func main(max_range):
    var max_count = 1
    var req_num = 0


    for i in range(max_range-1,1,-2):
        if(max_count < get_collatz_count(i)):
            max_count = get_collatz_count(i)
            req_num = i
    
    return req_num

func get_collatz_count(number):
    var count = 1
    var current_num = number;
    while true:
        if(current_num % 2 == 0):
            current_num  = current_num / 2
            count += 1
            
        else:
            current_num = 3 * current_num + 1
            count+=1
        if(current_num == 1):
            return count