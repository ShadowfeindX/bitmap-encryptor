require './bitmap_class'
require './keygen'
include KEYGEN

module BACK_END
	def start
		print "Please enter a command: "
		command = gets.chomp
		image = process_command(command)
		if image == false;image = nil;start;end
		if image == nil;return;end
		save_data(image)
		print "file saved!";puts ''
		image = nil;start
	end
	def print_scene
		x = 0; while x < 80 
		print '#'
		x += 1
		end	
		x = 0; while x < 80 
			print '#'
			x += 1
		end	
		x = 0; while x < 30 
			print '#'
			x += 1
		end
		print "      !Welcome!     "
		x = 0; while x < 30 
			print '#'
			x += 1
		end
		x = 0; while x < 30 
			print '#'
			x += 1
		end
		print "      !to  the!     "
		x = 0; while x < 30 
			print '#'
			x += 1
		end
		x = 0; while x < 30 
			print '#'
			x += 1
		end
		print " !CRYPTOMATIC 9000! "
		x = 0; while x < 30 
			print '#'
			x += 1
		end
		x = 0; while x < 80 
			print '#'
			x += 1
		end
		x = 0; while x < 80 
			print '#'
			x += 1
		end	
		x = 0; while x < 3 
			puts ''
			x += 1
		end	
		x = 0; while x < 80 
			print '#'
			x += 1
		end	
		x = 0; while x < 3
			puts ''
			x += 1
		end
		puts "##### 1: Encrypt Image ######                    ##### A: Decrypt Image ######"
		puts ''
		puts "### 2: Generate CryptoKey ###                    ########## X: Exit ##########"
		x = 0; while x < 3
			puts ''
			x += 1
		end
		x = 0; while x < 80 
			print '#'
			x += 1
		end	
		x = 0; while x < 2
			puts ''
			x += 1
		end
	end
	def register_filename(filename)
		x = filename.length-4
		y = filename.length
		extention = filename[x...y]
		unless extention == ".bmp"
			filename = filename + ".bmp"
		end
		return filename
	end
	def process_command(command)
		commands = ['1','2','A','a','x','X']
		unless commands.include? command
			puts "That command is invalid!";puts ''
		return false;end
		if command == '1'
			print "Please enter filename: "
			filename = gets.chomp
			print "Please enter CryptoKey: "
			key = gets.chomp
			unless check_key(key);return false;end
			print "Processing data...."
			image = BMP::Encrypt.new(register_filename(filename))
			return [image.export,1,filename]			
		elsif command == '2'
			make_key;return false
		elsif command == 'a'||command == 'A'
			print "Please enter filename: "
			filename = gets.chomp
			print "Please enter CryptoKey: "
			key = gets.chomp
			unless check_key(key);return false;end
			print "Processing data...."
			image = BMP::Decrypt.new(register_filename(filename))
			return [image.export,2,filename]
		end
	end
	def save_data(image)
		print "saving image....."
		if image[1] == 1
			image[0].save_as("#{image[2]}_encrypted.bmp")
		elsif image[1] == 2
			image[0].save_as("#{image[2]}_decrypted.bmp")
		else
			puts "FAIL!"
		end
	end
end
