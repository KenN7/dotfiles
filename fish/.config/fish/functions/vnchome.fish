## function to connect to remote ssh, launch vnc server and connect client

function vnchome
    ssh ken@home.kenh.fr 'nohup x0vncserver -rfbport=5000 -display :0 -passwordfile ~/.vnc/passwd > /dev/null 2>&1 &'
    sleep 2
    vncviewer DotWhenNoCursor=1 home.kenh.fr::8888
    ssh ken@home.kenh.fr 'killall x0vncserver'; and echo 'x0vnc killed remotely'
end
