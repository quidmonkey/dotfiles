
# Grab headers from webpage
httpHeaders () {
    /usr/bin/curl -I -L $@ ;
}

# Download a web page and show info on what took time
httpDebug () {
    /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n";
}

# takes url
# find out when a server goes live
alias whenshesup=is_she_up
is_she_up () {
    while ! curl -Is $1 > /dev/null ; do sleep 1 ; done ; echo She\'s Up
}

alias ms=monitor_server
monitor_server () {
    # curl every 5 mins
    while curl -Is $1 > /dev/null ; do sleep 300 ; done ;
    msg=$1" is down"
    echo "Ruh Roh, ${msg}"
    osascript -e "display notification \"$msg\" with title \"Ruh Roh\""
    open $1
}

# post to an endpoint via curl
# takes two args
# first: data in the form of "param1=value1&param2=value2"
# second: the url
alias cpd=curl_post_data
curl_post_data () {
    curl --data $1 $2
}

# ddos - run in background!
alias ddos=curl_site_indefinitely
curl_site_indefinitely () {
    while [ 1 == 1 ]; do curl $1; sleep 5; done
}

