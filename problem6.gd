extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(100)
    var duration = OS.get_system_time_msecs() - start_time
    print("Answer: %s,\t Duration: %.3f sec" % [ans, float(duration)/1000.0])
    quit()

func main(n):

    var sum_of_squares = sum_of_seq(n, 2)
    var square_of_sum = pow(sum_of_seq(n, 1), 2)
    return square_of_sum - sum_of_squares

func sum_of_seq(n, p):
    var sum = 0
    for i in range(1, n + 1):
        sum += pow(i, p)
    return sum

