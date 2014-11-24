class UserScheduleEntryController < ApplicationController
    
  def create2
		parsed_json = ActiveSupport::JSON.decode(params[:horario])
		
		UserScheduleEntry.where(:user_id => params[:id]).delete_all
				
		parsed_json.each do |d, h|
		  user_schedule = UserScheduleEntry.new()
		  user_schedule.days_of_week = d
		  user_schedule.hours = h
		  user_schedule.user_id = params[:id]		  
		  user_schedule.save
		end
		
		render :json => 	{
								:size => 1
							}
	end
  
end