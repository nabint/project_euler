extends SceneTree


func _init():
    var start_time = OS.get_system_time_msecs()
    var ans = main()
    var duration = OS.get_system_time_msecs() - start_time
    print("Ans %s, Duration: %.2f" %  [ans,float(duration)/1000])
    quit()

func main():
    var arr_Name  = Array(read_csv_file("p022_names.txt"))
    var name_score = 0
    arr_Name.sort()
    for i in range(0,len(arr_Name)):
        name_score += (i+1) * get_index_count(arr_Name[i])
    return name_score

    

func get_index_count(given_str):
    var alphabet_count = 0
    for i in given_str:
        alphabet_count += i.to_utf8()[0] - 64
    return alphabet_count

func read_csv_file(fileName):
    var csv_file
    var f = File.new()
    f.open(fileName,File.READ)
    csv_file = f.get_csv_line()
    f.close()
    return csv_file