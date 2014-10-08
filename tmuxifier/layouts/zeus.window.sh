window_root "~/Projects/death_star"
new_window "Zeus"
split_h
split_v

run_cmd "zeus start" 1
run_cmd "sleep 1; rails s" 2
run_cmd "sleep 1; rake sunspot:solr:run" 3

select_pane 1
