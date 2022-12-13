extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()
func main():

    var number_count = 2
    var sum_ = 0
    while number_count < 1000000:
        var temp_sum = 0
        var string_rep = String(number_count)
        for i in range(0,len(string_rep)):
            temp_sum += pow(int(string_rep[i]),5)

        if (temp_sum == number_count):
            sum_ += temp_sum
        number_count += 1
        
    return sum_