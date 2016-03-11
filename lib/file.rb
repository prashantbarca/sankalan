module Sankalan
    class MDBFile
        attr_accessor :address,:name
        def initialize(address,name)
            self.address = address
            self.name = name
        end
        def walk
            puts `echo "#{address}::print -ta file_t" | sudo mdb -k`.chomp
        end
    end
end
