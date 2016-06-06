$LOAD_PATH << 'lib/BMP'

module BMP
    class Read;   end
    class Write;  end
    class Encrypt;    end
    class Decrypt;    end
end

require 'Read'
require 'Write'
require 'Encrypt'
require 'Decrypt'
