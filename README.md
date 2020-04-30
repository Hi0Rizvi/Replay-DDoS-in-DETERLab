# Replay-DDoS-in-DETERLab
Replaying DDoS attacks in DETERLab testbed. In this setup, we create some client machines to make attack to the server machine. We use LDPlayer tool to make the attack event. We use open-source attack events. To measure the resources in the server we use collectd tool. We will make the attacks into the server, and in server we will observe the attack traffic to deploy any mitigation approach. We will show how can we collect the data in the server end to make any mitigation decision.
## TOOLS
1. LDPlayer to replay attack
2. Collectd
## Setup
Step 1: Make a DETERLab Experiment using DETERLAB.config file. Adjust the required number of nodes. 
