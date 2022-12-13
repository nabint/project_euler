extends SceneTree

var arr = [0,1,2,3,4,5,6,7,8,9] 

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var count = 1
    get_lex_permutation(999999)


func get_lex_permutation(n):
    var reqnum = ""
    var step
    var given_num = n

    for i in range(0,len(arr)):
        step = factorial(len(arr))/len(arr)
        var num_range = 0 
        given_num = n % factorial(len(arr))
        var temp_step = step
        
        while true:
            if ( given_num < step):
                break
            num_range += 1
            step += temp_step

        reqnum += str(arr[num_range])
        arr.remove(num_range)

    return reqnum

   



func factorial(n):
    var prod = 1
    for i in range(1,n+1):
        prod = prod * i
    return prod