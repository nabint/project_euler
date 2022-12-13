extends SceneTree

func _init():
    var start_time = OS.get_unix_time()
    var ans = main()
    var duration = OS.get_unix_time() - start_time
    print("Ans: %s, duration: %.2f secs" % [ans, duration])
    quit()

func main():
    var max_pal = 0
    for i in range (999, 100, -1):
        for j in range (i, 100, -1):
            var prod = i * j
            if (is_palindrome(String(prod)) and prod > max_pal):
                max_pal = prod
    return max_pal

func is_palindrome (n): 
    for i in range(0, len(n)/2):
        if (n[i] != n[len(n)-1-i]):
            return false
    return true
