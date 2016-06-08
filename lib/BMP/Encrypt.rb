module BMP
    class Encrypt
        def initialize(filename)
            @file = filename
            @original = Read.new "data/#{filename}.bmp"
            @matrix = Array.new( @original.width, Array.new(@original.height) )
            @encrypted = Write.new @original.width, @original.height

            @rows = (0...@original.height).to_a.shuffle(random: Random.new)
            @columns = (0...@original.width).to_a.shuffle(random: Random.new)
        end

        def encrypt
            @matrix.map.with_index do |x, i|
                x.map.with_index do |y, j|
                    @encrypted[@columns[i], @rows[j]] = @original[i,j].reverse.to_sym
                end
            end
        end
	
        def map
            File.open("data/#{@file}_key.bmp","wb") do |file|
                @rows.each do |x|
                    _ = (x == @rows.last ? ']' : '|')
                    file << x << _
                end
                @columns.each do |y|
                    _ = (y == @columns.last ? ']' : '|')
                    file << y << _
                end
            end
        end
        
        def export
            @encrypted.save_as "data/#{@file}_enc.bmp"
        end
    end
end
