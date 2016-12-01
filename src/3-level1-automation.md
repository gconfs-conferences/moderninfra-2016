# Level 1 - Automation

### Why

Common admin task like changing a configuration are easy: just SSH on the
server, modify it, and it's done !

... but what about it when you have 20 hosts ? 200 ? 2000 ?

* **20** : ok. You'll do it by hand. With errors, for sure
* **200** : uh. You'll write a small shell wrapper and spend hours writing
  checks to see it fail anyway
* **2000** : ok, either I'm quitting my job or we hire an intern

### Philosophy

* Stop doing everything by hand; describe it in **text files** instead
* Define infrastructure "as code"
* Manage "**states**" of "**resources**" representing a "**service**"
* Add an abstraction layer between infrastructure and its administrator

### The big picture

* A server knows :
    * an **inventory** composed of managed machines
    * **environment**-specifics parameters (network, names, ...)
    * **configurations** description
* The server and its client connect together
* The client applies the configuration it's concerned by
* The server get an application report back

### Benefits

* Uniformity / consistency
* Agility / Maintainability
* Better infrastructure knowledge
* Single point of truth
* Reduce complexity : save time

### Example

Remember : manage "**states**" of "**resources**" representing a "**service**"

Installing nginx

```
- name: "Install nginx"
  pkg:
      name: nginx
      state: installed
```

Start the service:

```
- name: "Ensure nginx is started"
  service:
      name:   nginx
      state:  started
```

### Solutions

- Puppet
- Chef
- Ansible
- Saltstack
- ...

### Puppet

* Needs:
    * A master server
    * An agent on clients
* Reference solution
* Ruby
* 2005

### Ansible

* Needs:
    * A SSH connexion to clients
    * Python installed on clients
* Easy to learn
* Used internally by Smile and numerous clients
* Python
* 2012

### SaltStack

* Needs:
    * Whatever please you : a SSH connexion or an agent on clients
* Most complete solution
* Worse documentation than Ansible
* Harder to use
* Python
* 2011

### Infrastructure as Code at the end

- If a machine description is not stored in a git repository, you just lost the
  game
- If you can't disable sshd on a machine, you just lost the game
