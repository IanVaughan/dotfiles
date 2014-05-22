window_root "~/Projects/death_star"
new_window "Zeus"
split_v 80

run_cmd "zeus start" 1
run_cmd "sleep 1; rails s" 2

select_pane 1
