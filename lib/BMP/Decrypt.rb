module BMP
    class Decrypt
        def initialize(filename)
            @file = filename
            @encrypted = Read.new "tests/#{@file}_enc.bmp"
            @matrix = Array.new( @encrypted.width, Array.new(@encrypted.height) )
            @decrypted = Write.new @encrypted.width, @encrypted.height
        end

        def parse
            File.open("tests/#{@file}_key.bmp","rb") do |file|
                contents = file.read.split(']')
                @rows = contents[0].split('|').map(&:to_i)
                @columns = contents[1].split('|').map(&:to_i)
            end
        end

        def decrypt
            @matrix.map.with_index do |x, i|
                x.map.with_index do |y, j|
                    @decrypted[i,j] = @encrypted[@columns[i], @rows[j]].reverse.to_sym
                end
            end
        end
	
        def export
            @decrypted.save_as "tests/#{@file}_dec.bmp"
        end
    end
end
