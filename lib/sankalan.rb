require "sankalan/version"
require 'process'
module Sankalan
    class Sankalan
        """
        This method checks if the program is being run as root
        Uses the echo $USER shell command to display the username of the current user. 

        PS : It might be a bad idea
        """

        def test
            user =  `echo $USER`
            if user.strip.chomp == "root"
                puts "You are groot. groot. "
            else
                puts "Please try again being groot."
                exit
            end

        end

        """
        Takes the name of a process and returns the Process class for it. 
        
        Calling instruction : find_process 'pulseaudio'
        Above command would return a Process class object. 
        """
        def find_process s
            x = `echo "::pgrep #{s}" | sudo mdb -k | awk {'print $9'}`.split ' '
            if x[1]==s
                addr = `echo "::pgrep #{s}" | sudo mdb -k | awk {'print $8'} | tail -1`.chomp
                pid = `echo "::pgrep #{s}" | sudo mdb -k | awk {'print $2'} | tail -1`.to_i
                pname = `echo "::pgrep #{s}" | sudo mdb -k | awk {'print $9'} | tail -1`.chomp
                p_exec = `echo "#{addr}::print -ta proc_t ! grep p_exec" | mdb -k | head -1 | awk {'print $6'}`.chomp.strip
                p_as = `echo "#{addr}::print -ta proc_t ! grep p_as" | mdb -k | head -1 | awk {'print $6'}`.chomp.strip
                p = Process.new pid,addr,pname,p_exec,p_as
            end
            p
        end
        """
        This method would be used to return a file structure. 

        It would take a processname as an argument, and then we would locate the files open by it. 
        """
    end
end
