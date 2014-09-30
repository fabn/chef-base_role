#<> Common utility packages useful to have in every system
default[:system_base][:packages] = [
    {name: 'tree'},
    {name: 'psmisc'},
    {name: 'tmux'},
    {name: 'autojump'},
    {name: 'curl'},
]

#<> Default ntp servers pool
default[:ntp][:servers] = %w(0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org)
