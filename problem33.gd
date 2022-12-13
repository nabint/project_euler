extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var deno_prod = 1
    var nume_prod = 1

    for i in range(10,100):
        if "0" in str(i):
            continue
        for j in range(i+1,100):
            if "0" in str(j):
                continue
            var cm_digit = remove_common_digit(str(i),str(j))
            if(cm_digit["has_common"] == true):
                var a_ans = ret_lowest_term(cm_digit["numbers"][0],cm_digit["numbers"][1])
                var b_ans = ret_lowest_term(i,j)
                if(a_ans == b_ans):
                    nume_prod *= a_ans[0]
                    deno_prod *= b_ans[1]
                

    return ret_lowest_term(nume_prod,deno_prod)[1]



func remove_common_digit(a,b):
    for i in str(a):
        for j in str(b):
            if i == j:
                b = b.replace(j,"")
                a = a.replace(i,"")
                return {"has_common":true,"numbers":[int(a),int(b)]}

    return{"has_common":false}


func ret_lowest_term(a,b):
    var nume = a
    var deno = b
    var loop_count
    
    if(nume <= deno):
        loop_count = nume
    else:
        loop_count = deno
    
    var i = 2

    while i <= loop_count:
        if( nume % i == 0 and deno % i == 0 ):
            nume = nume / i
            deno = deno / i
            i = 2
            if(nume <= deno):
                loop_count = nume 
            else:
                loop_count = deno 

        else:
            i += 1

    return [nume,deno]