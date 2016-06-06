module BMP
  class Decrypt
	def initialize(filename)
		@file = filename
		parse_file
		decrypt_file
	end	
	def parse_file
		@original = Read.new(@file)
		@matrix = Array.new(@original.height,Array.new(@original.width,""))
		@final = Write.new(@original.width,@original.height)
		filename = @file[0...@file.length-4]
		File.open("#{filename}_key.bmp","rb") do |file|
			num = ""
			@rows = Array.new
			while true
				char = file.read(1)
				if char == '|'
					@rows.push(num.to_i)
					num = char = ""
				elsif char == ']'
					@rows.push(num.to_i)
					break
				end
				num = num + char
			end
			num = ""
			@columns = Array.new
			while true
				char = file.read(1)
				if char == '|'
					@columns.push(num.to_i)
					num = char = ""
				elsif char == ']'
					@columns.push(num.to_i)
					break
				end
				num = num + char
			end
		end
	end
	def decrypt_file
		y = 0
		@matrix.each do |grid|
			x = 0
			grid.each do |point|
				@final[x,y] = @original[@columns[x],@rows[y]].reverse
				x += 1
			end
			y += 1
		end
	end
	def export
		return @final
	end
  end
end
