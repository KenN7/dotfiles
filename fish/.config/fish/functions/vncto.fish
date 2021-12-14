## function to connect to remote ssh, launch vnc server and connect client

## usage: vncto $user $ip $port, target has to have x0vncserver and client tigervnc
## e.g. vncto ken 192.168.1.50 22

function vncto
    ssh $argv[1]@$argv[2] -p $argv[3] 'nohup x0vncserver -rfbport=5000 -display :0 -passwordfile ~/.vnc/passwd > /dev/null 2>&1 &'
    sleep 2
    vncviewer DotWhenNoCursor=1 $argv[2]::5000
    ssh $argv[1]@$argv[2] -p $argv[3] 'killall x0vncserver'; and echo 'x0vnc killed remotely'
end
