# mount eel fileserver
alias mounteel=mountclients
function mountclients {
    local PASSWORD=$(<./password.txt)
    mkdir -p /Volumes/Clients
    mount_smbfs //awalters:$PASSWORD@empathy-fs/Clients /Volumes/Clients
}
