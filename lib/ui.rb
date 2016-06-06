$: << 'lib'
require 'bmp'
require 'keygen'

class UI
    include KEYGEN

    def initialize(scene)
        system 'clear'
        system 'cls'
        print scene
        start
    end

    def start
        loop do
            image = nil
            print "Please enter a command: "
            image = process(gets.chomp)
            redo unless image
        end
    end

    def check_ext(name)
        if name.rindex '.bmp' then name else name + '.bmp' end
    end
	
    def process(cmd)
        case cmd
            when '1'
                #~ gets filename and key from user
                print "Please enter filename: "
                filename = gets.chomp
                print "Please enter CryptoKey: "
                key = gets.chomp
                
                #~ checks validity of the given key
                #~ restarts program if invalid
                return nil unless check_key(key)
                
                #~ creates new encrypted image
                print "Processing data...."
                image = BMP::Encrypt.new check_ext(filename)
                
                #~ sends image information to be saved
                save [image.export, 1, filename]		
            when '2'
                #~ gets filename and key from user
                print "Please enter filename: "
                filename = gets.chomp
                print "Please enter CryptoKey: "
                key = gets.chomp
                
                #~ checks validity of the given key
                #~ restarts program if invalid
                return nil unless check_key(key)
                
                #~ creates decrypted image from keyfile
                print "Processing data...."
                image = BMP::Decrypt.new(check_ext(filename))
                
                #~ send image information to be saved
                save [image.export,2,filename]
            when 'A','a'
                #~ generates a key from the KEYGEN module
                make_key
                #return nil
            when 'X','x'
                #~ sends to at_exit method
                exit
        else
            puts "That command was invalid!"
        end
        
        return nil
    end       

    def save(image)
        print "saving image....."
        case image[1]
            when 1
                image[0].save_as("#{image[2]}_encrypted.bmp")
            when 2
                image[0].save_as("#{image[2]}_decrypted.bmp")
        else
            puts "error!"
            return nil
        end
        puts "saved!"
    end
	
    at_exit do
        system 'clear'
        system 'cls'
        puts "Thanks for using the Cryptomatic 9000!"
    end
end
