$: << 'lib'
require 'BMP'
require 'KEYGEN'

class CLI
    include KEYGEN
    alias k make_key
    
    def initialize(*args)
        #*args = ARGV
        start_keygen
        cmd, @key, *@files = ARGV
        #puts @files
        #puts @files.rindex('_enc') == @files.size-4
        send :"#{cmd[1]}" #rescue puts "Invalid argument!"
        #puts key
        #puts files
    end
    
    def h
        print "Usage: crypto [switches] [--] [key] [file1] [file2] [...]\n"\
              "  -h                display this menu\n"\
              "  -v                show version information\n"\
              "  -k                generate new crypto key\n"\
              "  -b                specify bitmap library\n"\
              "  -w                specify wavfile library\n\n"\
              "Example: crypto -b XX-XX-XX-XX img1_enc img2 img3_enc\n"\
              "Results: 2 of 2 files decrypted! 1 of 1 files encrypted!\n"
    end
    
    def b
        return nil unless check_key(@key)
        
#puts @files[1] #=== String.new
        
        #case @files
        #when Array
        #dec = @files.select{|f| f.index('_enc') == f.size-4}
        #puts dec
        
        #enc = (@files - dec)
        #puts enc
        
        
        
        #puts dec.empty?
        
            if !(dec = @files.select{|f| f.rindex('_enc') == f.size-4}).empty?
                dec.map.with_index do |f, i|
                    f = BMP::Decrypt.new f[0...f.size-4]
                    f.parse; f.decrypt; f.export
                    print "#{i+1} of #{dec.size} files decrypted! "
                end
            elsif !(enc = @files - dec).empty?
                #puts @files
                enc.map.with_index do |f, i|
                    f = BMP::Encrypt.new f
                    f.encrypt; f.map; f.export
                    puts "#{i+1} of #{enc.size} files encrypted!"
                end
            else
                puts "Filenames not recognized!"
            end
        #when String
        #    f = @files
        #    if f.rindex('_enc') == f.size-4
        #        f = BMP::Decrypt.new f[0...f.size-4]
        #        f.parse; f.decrypt; f.export
        #        print "1 file decrypted! "
        #    else
        #        f = BMP::Encrypt.new f
        #        f.encrypt; f.map; f.export
        #        puts "1 file encrypted!"
        #    end
        #else
        #    puts @files.class
        #end
    end
    
    def w
        puts "Not yet implemented!"
        exit
    end
end
        