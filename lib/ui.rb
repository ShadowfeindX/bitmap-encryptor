$: << 'lib'
require 'BMP'
require 'KEYGEN'

class UI
    include KEYGEN
    alias _0 make_key
    alias _X exit
    
    def initialize(scene)
        system 'clear';system 'cls'
        print scene
        start_keygen
        loop do
            print "Please enter a command: "
            send(:"_#{gets.upcase[0]}") #rescue puts "That command was invalid!"
        end
    end

    def check_ext(name)
        if name.include? '.bmp'
            puts 'Please do not include file extensions!'
            return nil
        end
        return name
    end
	
    def single
        print "Please enter Filename: "
        filename = check_ext(gets.chomp)
                
        print "Please enter CryptoKey: "
        key = check_key(gets.chomp)
                
        return nil unless key and filename
        return filename
    end
    
    def multi
        print "Please enter Filenames: "
        list = gets.chomp.split(' ')
        
        list.each {|name| return nil unless check_ext(name)}
        
        print "Please enter CryptoKey: "
        key = check_key(gets.chomp)
        return nil unless key
        
        return list
    end
    
    def _1
        image = single
        print "Processing data..."
        image = BMP::Encrypt.new image
        print "encrypting data..."; image.encrypt
        print "creating key..."; image.map
        print "saving image....."; image.export
        puts "saved!"
    end
    
    def _2
        image = single
        print "Processing data..."
        image = BMP::Decrypt.new image
        print "processing key data..."; image.parse
        print "decrypting data..."; image.decrypt
        print "restoring image..."; image.export
        puts "saved!"
    end
    
    def _A
        images = multi
        images.each do |name|
            print "Processing #{name}"
            image = BMP::Encrypt.new name
            print "encrypting #{name}..."; image.encrypt
            print "creating key for #{name}..."; image.map
            print   "saving #{name}....."; image.export
            puts "#{name} was saved!"
        end
    end
    
    def _B
        images = multi
        images.each do |name|
            print "Processing #{name}..."
            image = BMP::Decrypt.new name
            print "processing key #{name}..."; image.parse
            print "decrypting #{name}..."; image.decrypt
            print "restoring #{name}..."; image.export
            puts "saved!"
        end
    end
end
