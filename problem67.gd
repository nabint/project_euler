extends SceneTree
var cached_dict = {}
var arr

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()


func main():
    var f = File.new()
    f.open("p067_triangle.txt",File.READ)
    var inp = ""
    while not f.eof_reached():
        inp += f.get_line()+ "\n"
    f.close()
    arr = initialize_array(inp)
    return get_max(0,0)


func get_max(row,col):
    if row + 1 == len(arr):
        return arr[row][col]
    else:
        if(row*100+col in cached_dict):
            return cached_dict[row*100+col]
    
        var left = get_max(row+1,col) + arr[row][col]
        
        var rightMax = get_max(row+1,col+1) + arr[row][col]
        
        if(left > rightMax):
            cached_dict[row*100+col]=left
            return left
        else:
            cached_dict[row*100+col]=rightMax 
            return rightMax


func initialize_array(given_arr):
    var a = []
    var j = ""
    var b = []
    var count = 0
    for i in given_arr:
        
        count += 1
        
        if i == " ":
            b.append(int(j))
            j = ""
        
        elif i == "\n" :
            if int(j) == 0:
                continue
            else:
                b.append(int(j))
                j = ""
                a.append(b)
                b= []
        j += i
        
        if count == len(given_arr):
            if int(j) == 0:
                    continue
            b.append(int(j))
            j = ""
            a.append(b)
            
    return a
