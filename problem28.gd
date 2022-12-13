extends SceneTree

var spiral = []

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()


func main():
    initialize_arr(1001)
    return calculate_sum(1001)


func initialize_arr(n):
    var a = n * n
    var rw = 0
    var col = n-1
    var loop_count = -1
    var bottom_loop = n

    for i in range(0,n):
        spiral.append([])
        for j in range(n-1,-1,-1):
            spiral[i].append(0)

    while bottom_loop > floor(n/2):
        
        for j in range(col,loop_count,-1):
            spiral[rw][j] = a
            a -= 1
            col = j
        
        for i in range( rw + 1, bottom_loop ):
            spiral[i][col] = a
            a -= 1
            rw = i

        for i in range(col+1,bottom_loop):
            spiral[rw][i] = a
            a -= 1
            col += 1

        loop_count += 1

        for i in range(rw-1,loop_count,-1):
            spiral[i][col] = a
            a -= 1
            rw -= 1

        col-=1
        bottom_loop -= 1


func calculate_sum(n):
    var sum = 0
    for i in range(0,n):
        for j in range(0,n):
            if (i == 0 and j == 0):
                for k in range(0,n):
                    sum += spiral[k][k]
            
            elif(i == 0 and j == n-1):
                for k in range(n-1,-1,-1):
                    sum += spiral[n-k-1][k]
   
    return sum-1