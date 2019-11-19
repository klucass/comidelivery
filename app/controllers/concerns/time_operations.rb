module TimeOperations
	extend ActiveSupport::Concern

	private
	def time_to_minutos(time)
		(time.hour * 60) + time.min
	end
	def date_to_time(time)
		if time.nil? then "00:00"
		else
			time.strftime("%H:%M")
		end
	end
end