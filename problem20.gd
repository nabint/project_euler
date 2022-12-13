extends SceneTree
var sum_fact = "1"
func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    return calculate_fact(100)

func calculate_fact(n):
    var carry = 0
    var temp = 1
    var result = 0 
    for num in range(n,0,-1):
        carry = 0
        for i in range(len(sum_fact)-1,-1,-1):
            temp = ( int(sum_fact[i]) * num ) + carry
            carry = temp / 10
            sum_fact[i] = String ( temp%10 )
            if(carry && i == 0):
                var a = int(sum_fact[i]) + carry * 10 
                sum_fact[i] = String(a)
           

    for i in sum_fact:
        result += int(i)

    return result