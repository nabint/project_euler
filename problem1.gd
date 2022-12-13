extends SceneTree

func _init():
    main()
    quit()


func main():
    var sum = 0
    print(sum)
    for i in range(0, 1000):
        if (i % 3 == 0):
            sum += i
        elif (i % 5 == 0):
            sum += i
    print(sum)