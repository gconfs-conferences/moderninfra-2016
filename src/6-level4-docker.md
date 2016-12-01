# Level 4 - Docker

### What is a container

![containers](images/containers.png)

### Linux namespaces

- MNT - Mount
- PID - Process ID
- NET - Network
- IPC - Interprocess Communication
- UTS - Host and domain names
- UID - User ID
- cgroup

### Useful links for more details

- <http://www.haifux.org/lectures/299/netLec7.pdf>
- <http://man7.org/training/sec_isol_apis/sec_isol_apis_course_outline.html>
- <http://virli.nemunai.re/>

### Why containers

|                    | Ships within...     | Manual deployment takes...     | Automated deployment takes...     | Boots in...            |
|----------------    |-----------------    |----------------------------    |-------------------------------    |--------------------    |
| Bare Metal         | days                | hours                          | minutes                           | minutes                |
| Virtualization     | minutes             | minutes                        | seconds                           | less than a minute     |
| Containers         | seconds             | minutes                        | seconds                           | seconds                |

### What is Docker

- Containers
- Ecosystem

### Stuff

- Docker Swarm
- Shipyard
- Rancher
- CoreOS
- rkt
- Atomic

### Orchestration

- Hashicorp : Nomad
- Mesosphere : Mesos/Marathon
- Google : Kubernetes
