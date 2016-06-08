module KEYGEN
	def start_keygen
		@p = []
		@p << ('A'..'D').to_a\
		<< ('0'..'4').to_a\
		<< ('3'..'8').to_a\
		<< ('Q'..'S').to_a\
		<< ('I'..'P').to_a\
		<< ('2'..'3').to_a\
		<< ('3'..'9').to_a\
		<< ('R'..'Z').to_a
	end
	
	def make_key
		key = []
		key << @p[0][rand(4)]\
		<< @p[1][rand(5)] << '-'\
		<< @p[2][rand(6)]\
		<< @p[3][rand(3)] << '-'\
		<< @p[4][rand(8)]\
		<< @p[5][rand(2)] << '-'\
		<< @p[6][rand(7)]\
		<< @p[7][rand(9)]
		puts key.join
	end
	
	def check_key(key)
		tests = []; key.delete! '-'
		@p.each_index do |i|
		  tests << @p[i].include?(key[i])
		end
		
		unless tests.include? false
		  puts "CryptoKey confirmed!"
          return true
        end

		puts "That key is invalid!"
		return false
	end
end
