extends SceneTree

func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()
func main():
    var day_count = 2
    var day_in_dict = {
        1:31,
        3:31,
        4:30,
        5:31,
        6:30,
        7:31,
        8:31,
        9:30,
        10:31,
        11:30,
        12:31
    }
    var count = 0 
    for year in range(1900,2001):
        for month in range(1,13):
            var no_of_days
            if month == 2:
                if (year) % 100 == 0 && (year) % 400 == 0:
                   
                    no_of_days = 29
                elif year % 4 == 0 && (year % 100) != 0:
                    
                    no_of_days = 29
                else:
                    no_of_days = 28
            else:
                no_of_days = day_in_dict[month]
            
            day_count  = ((day_count + no_of_days) % 7)
            
            if day_count == 1:
                print("Sunday",year)
                print("Month",month)
                if year == 1990:
                    continue
                count += 1 
            
             
    
    return count