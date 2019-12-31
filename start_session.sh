socket_file=/var/tmux_sessions/shared_session
tmux -S $socket_file attach || (rm -f $socket_file && tmux -S $socket_file)
