extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var currentTriagNo = 0
    var count = 1
    while true:
        currentTriagNo += count
        count += 1
        if( currentTriagNo % 2 == 0):#Since even number are most divisable numbers
            if( max_div(currentTriagNo) > 500):
                return currentTriagNo

func max_div(n):
    var count = 0
    for i in range( 2, sqrt(n)+1 ):
        if ( n % i == 0 ):
            count += 1

    return (count*2) + 2
