module BMP
  class Encrypt
	def initialize(filename)
		@file = filename
		parse_file
		encrypt_file
		create_key
	end
	def parse_file
		@original = Read.new(@file)
		@matrix = Array.new(@original.height,Array.new(@original.width,""))
		@final = Write.new(@original.width,@original.height)
		
		@rows = Array.new
		continue = false
		next_row = rand(0...@original.height)
		while continue == false
			if @rows.include? next_row
				next_row = rand(0...@original.height)
			else
				@rows.push(next_row)
			end
			if @rows.length == @original.height
				continue = true
			end
		end

		@columns = Array.new
		continue = false
		next_column = rand(0...@original.width)
		while continue == false
			if @columns.include? next_column
				next_column = rand(0...@original.width)
			else
				@columns.push(next_column)
			end
			if @columns.length == @original.width
				continue = true
			end
		end
	end
	def encrypt_file
		y = 0
		@matrix.each do |grid|
			x = 0
			grid.each do |point|
				@final[@columns[x],@rows[y]] = @original[x,y].reverse
				x += 1
			end
			y += 1
		end
	end	
	def create_key
		filename = @file[0...@file.length-4]
		File.open("#{filename}_key.bmp","wb") do |file|
			x = 0
			@rows.each do |num|
				if x != @rows.length-1
					file << @rows[x]
					file << '|'
					x += 1
				else
					file << @rows[x]
					file << ']'
				end
			end
			x = 0
			@columns.each do |num|
				if x != @columns.length-1
					file << @columns[x]
					file << '|'
					x += 1
				else
					file << @columns[x]
					file << ']'
				end
			end
		end
	end
	def export
		return @final
	end
  end 
end