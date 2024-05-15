[Ansible][ansible] playbook to configure my (private) Minecraft server. The
philosophy here is that everything should be configured _here_ and deployed
over Ansible. Any manual changes to the server configuration will likely be
overwritten.

Installed components
====================

* [Paper][paper] server
* Systemd service
* [mcrcon][mcrcon] to interact with the console
* Daily server backups
* Lighttpd server (with SSL) for access to DynMap

Plugins
=======
* [Vault][vault]
* [EssentialsX][esx]
* [LuckPerms][lp]
* [DynMap][dynmap]
* [Cenotaph][cenotaph]
* [Spark][spark]

Prereqs
=======
* Ubuntu 24.04
* A user capable of sudoing
* Pipenv (for Python dependencies) on your workstation - `pip install pipenv`

Setup
=====
1. Clone this repository
2. Get the vault password and put it in a file named `vault-password`. You can,
   of course, start from scratch. All "secret" variables are proxied in
   `vars.yml`.
3. Install the required Python packages
    ```bash
    source .envrc # done automatically if you have direnv
    pipenv install
    ```

Configuration
=============
* `production` - Server inventory
* `group_vars/servers/vars.yml` - Configuration values
* `group_vars/servers/vault.yml` - Secret configuration values
* `/files` and `/templates` - Config files for the Minecraft server itself

Use
=====

```bash
$ ansible-playbook main.yml --user <remote_user>
```

[ansible]: https://www.ansible.com/
[cenotaph]: https://www.spigotmc.org/resources/cenotaph.2180/
[dynmap]: https://www.spigotmc.org/resources/dynmap.274/
[esx]: https://www.spigotmc.org/resources/essentialsx.9089/
[lp]: https://luckperms.net/
[mcrcon]: https://github.com/Tiiffi/mcrcon
[paper]: https://papermc.io/
[spark]: https://spark.lucko.me/
[vault]: https://www.spigotmc.org/resources/vault.34315/
