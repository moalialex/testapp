Rails.application.routes.draw do
  root 'home#control'
  get 'home/filter_levels'
  get 'home/level_control'
  post 'home/level_control'

  get 'home/edit_zone_variable'
  put 'home/update_zone_variable'

  
  get 'home/get_level_data'
  get 'home/get_zone_data'
  get 'home/filter_locations'
end
