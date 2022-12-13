extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()


func main():
    
    var sm = 0
    for i in range(1,1000000):
        if(is_palindrome(str(i)) and is_palindrome(get_binary_equivalent(i))):
            sm += i
    return sm


func get_binary_equivalent(n):
    
    var binary_str = ""
    while n > 0:
        binary_str += str( n % 2 )
        n = n / 2
    return binary_str


func is_palindrome (n): 

    for i in range(0, len(n)/2):
        if (n[i] != n[len(n)-1-i]):
            return false
    return true