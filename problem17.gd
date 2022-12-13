extends SceneTree
var base_count={
        1:3,
        2:3,
        3:5,
        4:4,
        5:4,
        6:3,
        7:5,
        8:5,
        9:4,
        10:3,
}

var tenth_count = {
        11:6,
        12:6,
        13:8,
        14:8,
        15:7,
        16:7,
        17:9,
        18:8,
        19:8,
        
}

var tenth_place = {
        10:3,
        20:6,
        30:6,
        40:5,
        50:5,
        60:5,
        70:7,
        80:6,
        90:6,
}

var hundred_count = 7 
var and_count = 3

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var sum = 0

    for i in range(1,1001):
        
        sum += get_word_count(i)

    return sum


func get_word_count(num):
    if(num<11):
        return base_count[num]
    
    elif(num < 20):
        return tenth_count[num]
    
    elif(num < 100):

        if(num % 10 == 0):
            
            return tenth_place[(num/10) * 10]
        
        return tenth_place[(num/10) * 10] + base_count[num%10]
    

    elif(num < 1000):
        
        if(num % 10 == 0 and ( ( num/10 ) % 10 ) == 0):
            return base_count[num/100] + hundred_count;

        elif( ( num/10 ) % 10 == 0 and num % 10 != 0):
            return (base_count[num/100] + hundred_count + and_count + base_count[num%10])
        
        elif (num % 10 == 0):
            return base_count[ num/100 ] + hundred_count + tenth_place[(( num/10 ) % 10 ) * 10] + and_count
        
        elif( num % 100 < 20):
            return (base_count[num/100] + hundred_count + and_count + tenth_count[num%100] )

        return (base_count[num/100] + hundred_count + tenth_place[((num/10)%10)*10] + and_count + base_count[num%10])

    elif ( num >= 1000 ):
        return 11

