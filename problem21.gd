extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var amicable= 0
    for i in range(1,10000):
        var a = get_sum_of_div(i)
        var b = get_sum_of_div(a)
        if(b == i and a != b):
            amicable += i
    return amicable


func get_sum_of_div(num):
    var sum = 0
    for i in range(2,sqrt(num)+1):
        if(num % i == 0):      
            sum += i
            sum += (num/i)
    return sum+1