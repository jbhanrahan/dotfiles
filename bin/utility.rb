require 'Open3'

def kill_process_on_port port
  kill_process port
  wait_for_process_to_terminate port
end

def kill_process port
  pid = get_pid port
  return if pid.length == 0
  Open3.popen3("kill #{pid}")
end

def wait_for_process_to_terminate port
  while get_pid(port).length != 0
    puts "waiting for process to die, pid returns..." + get_pid(port)
  end
end

def get_pid port
  `lsof -n -i4TCP:#{port} | grep LISTEN | awk '{print $2}'`
end
