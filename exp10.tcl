# sliding window protocol in normal situation
set ns [new Simulator]
set nf [open out.nam w]
$ns namtrace-all $nf
$ns trace-all [open out.tr w]

### build topology with 6 nodes
proc finish {} {
        global ns nf
        $ns flush-trace
	#Close the trace file
        close $nf
	#Execute nam on the trace file
        exec nam out.nam &
        exit 0
} 	
	set s1 [$ns node]
        set s2 [$ns node]
        set r1 [$ns node]
        set r2 [$ns node]
        set s3 [$ns node]
        set s4 [$ns node]
        $s2 color "red"
        $s4 color "red" 
	$r1 color "blue"
        $r2 color "blue"
	$s1 color "green"
	$s3 color "green"
$ns duplex-link $s1 $r1 0.5Mb 50ms DropTail
        $ns duplex-link $s2 $r1 0.5Mb 50ms DropTail
        $ns duplex-link $r1 $r2 0.5Mb 50ms DropTail
        $ns duplex-link $r2 $s3 0.5Mb 50ms DropTail
        $ns duplex-link $r2 $s4 0.5Mb 50ms DropTail
$ns duplex-link-op $s1 $r1 orient right-down
        $ns duplex-link-op $s2 $r1 orient right-up
        $ns duplex-link-op $r1 $r2 orient right
        $ns duplex-link-op $r2 $s3 orient right-up
        $ns duplex-link-op $r2 $s4 orient right-down
Agent/TCP set nam_tracevar_ true
set tcp [$ns create-connection TCP $s1 TCPSink $s3 0]
$tcp set windowInit_ 4
$tcp set maxcwnd_ 4
$tcp set class_ 0 
set ftp [$tcp attach-app FTP]

$ns add-agent-trace $tcp tcp
$ns monitor-agent-trace $tcp
$tcp tracevar cwnd_ 
set tcp1 [$ns create-connection TCP $s2 TCPSink $s4 0]
$tcp1 set windowInit_ 1
$tcp1 set maxcwnd_ 1
$tcp1 set class_ 0
set ftp1 [$tcp1 attach-app FTP]
#set cbr [$ns create-connection CBR $s2 Null $s4 1]
#$cbr set packetSize_ 500
#$cbr set interval_ 0.05
#$cbr set class_ 1 
$ns at 0.1 "$ftp start"
$ns at 1.7 "$ftp stop"
#$ns at 0.1 "$cbr start"
#$ns at 1.7 "$cbr stop"
$ns at 0.1 "$ftp1 start"
$ns at 1.7 "$ftp1 stop"
$ns at 2.0 "finish"
### add annotations
$ns at 0.0 "$ns trace-annotate \"Normal operation of <Sliding Window> with window size, 4\""
$ns at 0.1 "$ns trace-annotate \"FTP starts at 0.1\""
$ns at 0.1 "$ns trace-annotate \"CBR starts at 0.1\""
$ns at 0.11 "$ns trace-annotate \"Send Packet_0,1,2,3 : window size, 4\""
$ns at 0.32 "$ns trace-annotate \"Ack_0,1,2,3\""
$ns at 0.46 "$ns trace-annotate \"Send Packet_4,5,6,7 : window size, 4\""
$ns at 0.66 "$ns trace-annotate \"Ack_4,5,6,7\""
$ns at 0.81 "$ns trace-annotate \"Send Packet_8,9,10,11   : window size, 4\""
$ns at 1.00 "$ns trace-annotate \"Ack_8,9,10,11\""
$ns at 1.16 "$ns trace-annotate \"Send Packet_12,13,14,15  : window size, 4\""
$ns at 1.35 "$ns trace-annotate \"Ack_12,13,14,15\""
$ns at 1.50 "$ns trace-annotate \"Send Packet_16,17,18,19   : window size, 4\""
$ns at 1.71 "$ns trace-annotate \"Ack_16,17,18,19\""
$ns at 1.8 "$ns trace-annotate \"FTP stops at 1.7\""
$ns at 1.8 "$ns trace-annotate \"CBR stops at 1.7\"" 

#Run the simulation
$ns run
