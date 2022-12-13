extends SceneTree
var arr = initialize_array("""75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23""")



func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()


func main():
    print( get_max(0,0))


func get_max(row,col):
    if row + 1 == len(arr):
        return arr[row][col]

    else:        
        var left = get_max(row+1,col) + arr[row][col]
        
        var rightMax = get_max(row+1,col+1) + arr[row][col]
        
        if(left > rightMax):
            return left
        else:
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
            b.append(int(j))
            j = ""
            a.append(b)
            b= []
        j += i
        
        if count == len(given_arr):
            b.append(int(j))
            j = ""
            a.append(b)
            
    return a
