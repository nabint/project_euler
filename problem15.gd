extends SceneTree
var count = 0;
var cached_dict = {}


func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main(20,20)
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans, float(duration)/1000])
    quit()


func main ( x_limit,y_limit ):
    return ( get_next_points( [0,0], x_limit, y_limit) )


func get_next_points(point, x_limit, y_limit):
    
    if point[0] >= x_limit:
        return 1
    
    elif point[1] >= y_limit:
        return 1

    if( point[1] <= y_limit-1):

        if point[0]*100 + point[1] in cached_dict:
            return cached_dict[point[0]*100 + point[1]]
        
        else:
            var a = ( get_next_points([point[0]+1, point[1] ], x_limit, y_limit) 
          + get_next_points( [point[0], point[1]+1], x_limit, y_limit))
            cached_dict[point[0]*100 + point[1]] = a
            return a

    return (get_next_points([point[0]+1, point[1]], x_limit, y_limit) 
          + get_next_points([point[0], point[1]+1], x_limit, y_limit))
