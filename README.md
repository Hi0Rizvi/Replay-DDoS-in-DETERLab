# Replay-DDoS-in-DETERLab
Replaying DDoS attacks in DETERLab testbed. In this setup, we create some client machines to make attack to the server machine. We use LDPlayer tool to make the attack event. We use open-source attack events. To measure the resources in the server we use collectd tool. We will make the attacks into the server, and in server we will observe the attack traffic to deploy any mitigation approach. We will show how can we collect the data in the server end to make any mitigation decision.
## TOOLS
1. LDPlayer to replay attack
2. Collectd
## Setup

**Step 1:** Make a DETERLab Experiment using [deterlab configuration file](deterlab.config) file. Adjust the required number of nodes as required.

**Step 2:** Use the [server.sh](/Server/server.sh) file to configure the server. 
NOTE: I use localroot (https://localroot.isi.edu/) configuration. All the configuration files can be found in [Server](/Server) directory. Adjust your server address according to the DETERLab server address. Also, you might need to change the address of resolv.conf. I also install collectd to get the resource consumption. If you do not need resource consumption, then just ignore it. If you use collectd, then you might need to change the directory for writing the csv files.

**Step 3:** Use [controller.sh](/Controller/controller.sh) to configure the controller. 
NOTE: controller.sh requires protobuf. Change your directory accordingly in controller.sh. The tar files for both protobuf and LDPlayer are given. 

**Step 4:** Use "pssh -h hosts.txt -p 11 -t 100000000 -I <./client-1.sh" to install LDPlayer in all the clients. A sample hosts.txt is also given. Here, I run client-1.sh in 11 machines parallel. 
Server, controller, and clients should be ready by now. 

**Step 5:** Keep the raw files in /tmp/ directory of the controller. Raw files can be found in /nfs/lander/dns/attack_data/B_Root_DDoS_raw directory. You can try with pcap or text-formatted files too. But for me raw files gave me the best outcome. 
It's time to run the experiment. 

**Step 6:** Start BIND using "sudo systemctl start bind9" and collectd using "sudo systemctl start collectd.service". Collectd will start saving the resource consumption. 

**Step 7:** Run controller: "xzcat /tmp/raw-2017-02-21/20170221-* | ./dns-replay-controller --input raw:- --address 10.1.1.24 --port 10053 --num_clients 22 --trace_limit 2". 

**Step 8:** Run clients: "pssh -h hosts.txt -t 0  -I <./run-clients.sh". run-clients.sh script is also given. This will run 22 clients.

**Step 9:** Server evaluation: you can use tcpdump to make any server evaluation using: "sudo tcpdump -w - -i eth5 port 53  | dnsanon --tcp-list-limit 400000 -c none  -p Q -i - -o - | java -jar Test.jar". You need to check which ethernet interface is getting the incoming traffic. 

