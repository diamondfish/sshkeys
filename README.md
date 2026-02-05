![](assets/sshkeys_1280x640.png)

# sshkeys

A simple command-line tool to manage SSH authorized_keys on Ubuntu/Linux. Easily list, add, and delete SSH public keys.

## Install

Run the following command to install `sshkeys` using the install script.

```bash
curl -fsSL https://raw.githubusercontent.com/diamondfish/sshkeys/master/install.sh | sudo bash
```

## Usage

```txt
sshkeys [options]

Actions (at least one required):
  -l, --list      List all keys in authorized_keys
  -a, --add       Add an SSH key (requires -k)
  -d, --delete    Delete an SSH key (requires -k)

Options:
  -k, --key       The SSH key to add or delete
  -u, --user      Specify target user (default: current user)
  -v, --version   Show version number
  -h, --help      Show this help message
  --update        Update sshkeys to the latest version
```

## Examples

```bash
# List keys
sshkeys -l                                      # List keys for current user
sshkeys -l -u www-data                          # List keys for another user

# Add a key
sshkeys -ak "ssh-rsa AAAA... user@host"         # Add a key
sshkeys -alk "ssh-rsa AAAA... user@host"        # Add a key and list result
sshkeys -u www-data -ak "ssh-ed25519 AAAA..."   # Add key for another user

# Delete a key
sshkeys -dk "ssh-rsa AAAA... user@host"         # Delete a key
sshkeys -dlk "ssh-rsa AAAA... user@host"        # Delete a key and list result
```

## Features

- **List keys**: View all authorized SSH keys for any user
- **Add keys**: Add new SSH keys with duplicate detection
- **Delete keys**: Remove SSH keys by matching key signature
- **User targeting**: Manage keys for any user with `-u` (uses sudo automatically)
- **Smart matching**: Keys are compared by type and key data only (ignores the comment/identifier part)
- **Combinable flags**: Use `-l` with `-a` or `-d` to see the result after modification
- **Safe operations**: Validates user existence, key format, and file permissions
- **Auto-setup**: Creates `.ssh` directory and `authorized_keys` file with correct permissions if needed

## How Key Matching Works

SSH public keys have the format: `key-type base64-key-data comment`

For example: `ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB... user@computer`

The `comment` part (e.g., `user@computer`) is just an identifier with no cryptographic significance. When checking for duplicates or deleting keys, `sshkeys` only compares the `key-type` and `base64-key-data` portions.

This means these two keys are treated as identical:
- `ssh-rsa AAAAB3... user1@computerA`
- `ssh-rsa AAAAB3... user2@computerB`

## Uninstall

```bash
sudo rm /usr/local/bin/sshkeys
```

## License

The MIT License (MIT)

## Author

Johan Bjarnle