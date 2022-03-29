## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Diagram](https://github.com/R0bertP/Showcase/blob/main/Diagrams/Vm_w_elk.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

![from PlayBook](https://github.com/R0bertP/Showcase/blob/main/Ansible/pentest.yml)
![from PlayBook](https://github.com/R0bertP/Showcase/blob/main/Ansible/metricbeat-playbook.yml)
![from PlayBook](https://github.com/R0bertP/Showcase/blob/main/Ansible/filebeat-playbook.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly avalible, in addition to restricting inbound access to the network.
 
The loadbalancer helps midigate the risk of a DDoS attack due to the load balancer observing the inflow of traffic and it able to distripute it to the the approprite Web VM. The Balancer is also able to check on the stability of the server before it sends traffic through with health probes, if an issue happens the load balacer with divert traffic until issue is resolved. On top of the the Jumpbox also helps restric the flow of traffic like a door to a house only those with the key or Private ip of the systems inside can get passed the door or JumpBox giving grater security to all systems beyond it 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems of the Vms on the network and system metrics.

Using Filebeat you're able to moniter the log data coming from the VM with web-servers an veiw any changes to log files 

Using Metricbeat allows you to monitor the metics of the OS or servers that it's ran on which can be viewed with elasticsearch or logstash 

The configuration details of each machine may be found below.

| Name     | Function                               | IP Address | Operating System |
|----------|----------------------------------------|------------|------------------|
| Jump Box | Gateway, Runs Docker,VM w/Ansible      |10.1.0.8    | Linux,Umbuntu    |
| Web-1    |Holds Websever,DVWA,VM w/Docker         |10.1.0.9    | Linux,Umbuntu    |
| Web-2    |Holds Websever,DVWA,VM w/Docker         |10.1.0.10   | Linux,Umbuntu    |
| Elk      |runs ELKstack                           |10.0.0.4    | Linux,Umbuntu    |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
99.120.2.190 (My Public IP)

Machines within the network can only be accessed by my Jumpbox VM.

Which machine did you allow to access your ELK VM? -JumpBox VM
What was its IP address? 20.127.78.22

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |    My local IP       |
|  Web 1   | No                  |     10.1.0.8         |
|  Web 2   | No                  |     10.1.0.8         |
| Elk      | Yes     via port 5101|   My local Ip       |
|Load Balancer| Yes  via port 80 |  My local IP         |
### Elk Configu

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this allows you to streamline
the proccess by not having to manually set up the configuration one at a time which saves time also once in a playbook it can be depoyed to other servers in the futer 

The playbook implements the following tasks:
- First Dock.io must be installed followed by python3-pip
- Next the the memory needs to be increased in order run everything so the next command increases memory to 262144
- The last part Downloads,Installs, and launches the elk docker to the elk VM 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Diagrams](https://github.com/R0bertP/Showcase/blob/main/Diagrams/docker_ps.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:Web-1 10.1.0.9 and Web-2 10.1.0.9

We have installed the following Beats on these machines:Filebeats and Metricbeats

These Beats allow us to collect the following information from each machine:
Filebeats is collecting the log data for Web-1 and Web-2 and watching out for any log changes this is recorded on Elasticsearch or Logstash and is visible though kibana which will give indepth detail about when and how the log was altered 
Metricbeats record the metric data of the system it takes those recording and you're able to look into it with Kibana to see what's going on with the GPu,CPU,MEM,ect

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat-config file to /etc/ansible/filebeat-config.yml
- Update the /etc/ansible/filebeat-config.yml file scroll to line #1106 and replace hostIP address with the IP address of your machine keeping the port if you scroll a little more you'll see setup.kibana: also change the hostIp with your meachine ip
- Run the playbook, and navigate to http://http://10.0.0.4/:5601/app/kibana to check that the installation worked as expected

- _Which file is the playbook?Filebeat-playbook.yml Where do you copy it? /etc/ansible/file/Filebeat-playbook.yml
- _Which file do you update to make Ansible run the playbook on a specific machine? run nano /etc/ansible/hosts an update your VMs private IPs into the file that will specify where the file is going 
- _Which URL do you navigate to in order to check that the ELK server is running?http://http://10.0.0.4/:5601/app/kibana
