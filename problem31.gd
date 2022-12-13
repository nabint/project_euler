extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var ways = 0

    for po1 in range(0,2):
        for p50 in range(0,5):
            print(p50)
            for p20 in range(0,11-2*p50):
                for p10 in range(0,21-2*p20):
                    for p5 in range(0,41-2*p10):
                        for p2 in range(0,101-2*p5):
                            for p1 in range(0,201-2*p2):
                                var a = po1 * 100 + p1 + 2*p2 + 5 * p5 + 10 * p10 + 20 * p20 + 50 * p50
                                if(a == 200):
                                    ways += 1


   
    return ways+2 # One for po1 + po1 and Another for po2 