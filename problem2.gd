extends SceneTree

func _init():
    main(4000000)
    quit()
func main(max_range):
    var a = 1
    var b = 2
    var sum = 2
    var temp = 0
    while(temp <= max_range):
        temp = a + b
        a = b
        b = temp
        if (temp % 2 == 0):
            sum += temp
    print(sum)