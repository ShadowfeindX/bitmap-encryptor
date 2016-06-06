module KEYGEN
	def key_params
		@params = Array.new
		@params[0] = ('A'..'D').to_a
		@params[1] = ('0'..'4').to_a
		@params[2] = '-'
		@params[3] = ('3'..'8').to_a
		@params[4] = ('Q'..'S').to_a
		@params[5] = '-'
		@params[6] = ('I'..'P').to_a
		@params[7] = ('2'..'3').to_a
		@params[8] = '-'
		@params[9] = ('3'..'9').to_a
		@params[10] = ('R'..'Z').to_a
	end
	def make_key
		key_params
		key = String.new
		key += @params[0][rand(0...4)]
		key += @params[1][rand(0...5)]
		key += @params[2]
		key += @params[3][rand(0...6)]
		key += @params[4][rand(0...3)]
		key += @params[5]
		key += @params[6][rand(0...8)]
		key += @params[7][rand(0...2)]
		key += @params[8]
		key += @params[9][rand(0...7)]
		key += @params[10][rand(0...9)]
		puts key
	end
	def check_key(key)
		key_params
		if @params[0].include? key[0]
		if @params[1].include? key[1]
		if @params[3].include? key[3]
		if @params[4].include? key[4]
		if @params[6].include? key[6]
		if @params[7].include? key[7]
		if @params[9].include? key[9]
		if @params[10].include? key[10]
			puts "CryptoKey confirmed!"
			return true
		end;end;end;end;end;end;end;end
		puts "That key is invalid!"
		return false
	end
end
