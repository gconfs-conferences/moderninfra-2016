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

but : plus rien faire
service autonome
pager qui sonne plus
qu'on puisse dormir

Service discovery
Consuuuul

j'me fous d'où est l'intra, c'est pas mon problème, j'ai pas à connaitre son
IP, j'veux juste que ça aille dessus

Problème : DBs

Trouver un moyen de garder une persistence. Pas vraiment de solution au niveau
docker, genre pas de flag "ça c'est un data container"

Vagrant : Makefile pour la VM

### Bande de tarés

- Netflix
- 37% of USA traffic on peak hour
- Simian Army
- Full AWS

http://techblog.netflix.com/2011/04/lessons-netflix-learned-from-aws-outage.html

j'viens dans ton DC avec une batte et de l'essence et paf

certifs, le dégager et regen les clés

Design for failure
Resilience is the key feature


Plus que des outils
Simplifier les usages
Libre service
Ouverture du SI

VM qui démarre 15min plus vite, osef à la limite, on veut juste être
indépendant
Demain les users auront des besoins qu'on envisage pas
et on aura des besoins énormes mais pour 5min

