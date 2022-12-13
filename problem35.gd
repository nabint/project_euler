extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

var sum_dict = {}
var palin_prime = []


func main():
    var circular_prime = 0 
    var is_circular = true
   
    for i in range(1,1000000,2):
        
        if(check_prime(i)):
            var str_num = str(i)
            is_circular = true

            for k in range(len(str_num)-1):
                var new_str = ""
                
                for j in len(str_num):

                    if( j + 1 == len(str_num) ):
                        new_str += str_num[0]
                    
                    else:
                        new_str += str_num[j+1]
                        
                str_num = new_str

                if(check_prime(int(str_num))==false):
                    is_circular = false
                    break

            if is_circular: 
                
                circular_prime+=1

    return circular_prime


func check_prime(n):
    
    var sq = int(sqrt(n)) + 1
    for i in range(2,sq):
        if ( n % i == 0):
            return false

    return true