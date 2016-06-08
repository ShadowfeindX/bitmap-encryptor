  class Decrypt
	def initialize(filename)
		@file = filename
		#@original = Read.new "tests/#{@file}_enc.bmp"
		#@matrix = Array.new( @original.height, Array.new(@original.width) )
		#@final = Write.new @original.width, @original.height
		
		parse_file
		#decrypt_file
	end	
	def parse_file
		#filename = @file[0...@file.length-4]
		file = File.open("tests/#{@file}_key.bmp","rb") #do |file|
		contents = file.read.split(']')
		file.close
		@rows = contents[0].split('|')
		@columns = contents[1].split('|')
		 puts @rows, @columns
			#num = ""
			#@rows = Array.new
			#while true
			#	char = file.read(1)
			#	if char == '|'
			#		@rows.push(num.to_i)
			#		num = char = ""
			#	elsif char == ']'
			#		@rows.push(num.to_i)
			#		break
			#	end
			#	num = num + char
			#end
			#num = ""
			#@columns = Array.new
			#while true
			#	char = file.read(1)
			#	if char == '|'
			#		@columns.push(num.to_i)
			#		num = char = ""
			#	elsif char == ']'
			#		@columns.push(num.to_i)
			#		break
			#	end
			#	num = num + char
			#end
		#end
	end
	#def decrypt_file
	#	y = 0
	#	@matrix.each do |grid|
	#		x = 0
	#		grid.each do |point|
	#			@final[x,y] = @original[@columns[x],@rows[y]].reverse
	#			x += 1
	#		end
	#		y += 1
	#	end
	#end
	#def export
	#	@final.save_as "tests/#{@file}_dec.bmp"
	#end
  end
  
  Decrypt.new(ARGV.first)
