extends SceneTree
var prod_list = []


func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    for i in range(2,10000):
        if "0" in str(i):
            continue
        var j_loop
        if(i>= 1000):
            j_loop = 10
        j_loop = 100

        for j in range(2,j_loop):
            if "0" in str(j) or "0" in str(i*j):
                continue
            var reslt = str(i) + str(j) + str(i*j)

            if(len(reslt) == 9):
                if(check_pandigital(reslt) == true):
                    if i*j in prod_list:
                        continue
                    else:
                        prod_list.append(i*j)
            
    var summ = 0
    for i in prod_list:
        summ+=i
    return summ

func check_pandigital(reslt):
    for i in range(0,len(reslt)):
        for j in range(i+1,len(reslt)):
            if reslt[i] == reslt[j]:
                return false
    
    return true

