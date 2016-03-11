require 'mdbfile.rb'
module Sankalan
    class Process
        attr_accessor :pid,:address,:pname,:p_exec,:p_as
        def initialize(p,add,name, p_exec,p_as)
            self.pid = p
            self.address=add
            self.pname = name
            self.p_exec = p_exec
            self.p_as = p_as
        end

        """
        This method is used to do a ::print on a process class.
        """
        def walk
            puts `echo "#{address}::print -ta proc_t" | sudo mdb -k`.chomp
        end


        """
        """

        def dtrace one="",two="",three="",four="",stop=false
                if stop
                    p = spawn("dtrace -wn '#{one}:#{two}:#{three}:#{four} /pid==#{pid}/ {printf(\"%s\",execname); stop();}' >dtraceoutput &")
                else
                    p = spawn("dtrace -wn '#{one}:#{two}:#{three}:#{four} /pid==#{pid}/ {printf(\"%s\",execname); }' >dtraceoutput &")
                end
                Process::Process.detach p
        end

        """
        Pause the process
        """

        def pause
            `kill -STOP #{pid}`
        end

        """
        Start the process
        """

        def restart
            `prun #{pid}`
        end

        """
        Finding files open by a process
        """

        def find_file 
            addr = `echo "#{address}::pfiles" | mdb -k | awk '$2 == "REG" {print $3}'`.chomp.strip
            na = `echo "#{address}::pfiles" | mdb -k | awk '$2 == "REG" {print $4}'`.chomp.strip
            f = MDBFile.new addr,na
            f
        end
    end
end
