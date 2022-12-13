extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():

    for b in range(1,1000):
        for a in range(1,b):
            var c = 1000 - a - b
            if (c<=b):
                break
            if ( a*a + b*b == c*c ):
                return a*b*c 
        