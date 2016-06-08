$: << 'lib'
require 'BMP'
require 'KEYGEN'

class CLI
    include KEYGEN
    alias k make_key
    
    def initialize(*args)
        start_keygen
        cmd, @key, *@files = ARGV
        send :"#{cmd[1]}" #rescue puts "Invalid argument!"
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
        dec = @files.select{|f| f.rindex('_enc') == f.size-4}
        enc = @files - dec
        
        *threads = Thread.new do
            unless dec.empty?
                dec.map.with_index do |f, i|
                    f = BMP::Decrypt.new f[0...f.size-4]
                    f.parse; f.decrypt; f.export
                    puts "#{i+1} of #{dec.size} files decrypted! "
                end
            else
                puts "No decryptable files found!"
            end
        end
        
        threads << Thread.new do
            unless enc.empty?
                enc.map.with_index do |f, i|
                    f = BMP::Encrypt.new f
                    f.encrypt; f.map; f.export
                    puts "#{i+1} of #{enc.size} files encrypted!"
                end
            else 
                puts "No encryptable files found!"
            end
        end
        
        threads.map {|thr| thr.join}
    end
    
    def w
        puts "Not yet implemented!"
        exit
    end
end
        