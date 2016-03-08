namespace :manage_event do

  desc "Remove the date point event over six months"
  task :delete_last_date_point_event => :environment do
    EventDate.delete_all(["id in (?)", EventDate.get_ids_date_event_old])
  end

  desc "Generate new date point"
  task :generate_new_date_point => :environment do
    Event.find_each do |event|
      EventDate.generate_dates_event(event, event.date_events.get_date_last_point + 1.day)
    end
  end

end