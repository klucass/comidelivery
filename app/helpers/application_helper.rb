module ApplicationHelper
	def tempo_de_espera(time)
		total_time = Time.now.to_i - time
		if total_time < 86400
			[total_time / 3600, total_time/ 60 % 60, total_time % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
			else
			Time.at(time).strftime("%d/%m/%Y - %H:%M")
		end

	end

	def date_to_time(time)
		if time.nil? then "00:00"
		else
			time.strftime("%H:%M")
		end
	end

	def centavos_em_real(centavos)
		dinheiro = Money.new(centavos, "BRL")

		humanized_money(dinheiro)
	end

	def time_to_minutos(time)
		(time.hour * 60) + time.min
	end

   def timestamp_in_local_zone(timestamp)
      Time.zone = "Brasilia"
      Time.utc(timestamp).in_time_zone
   end

end
