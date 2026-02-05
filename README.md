<!-- ![](assets/zapdir_1280x640.png) -->

# zapdir

A fast, safe and efficient way to delete large directories containing many files in Linux using `rsync`.

## Install

Run the following command to install `zapdir` using the install script.

```bash
curl -fsSL https://raw.githubusercontent.com/diamondfish/zapdir/master/install.sh | sudo bash
```

## Usage

```txt
zapdir [options] directory

Options:
  -v, --version   Show version number.
  -h, --help      Show this help message.
  -u, --update    Update zapdir to the latest version.

# Examples
zapdir /path/to/folder
zapdir -f ./folder
zapdir --update
```

<!-- ## Options

| Flag          | Description                          |
| ------------- | ------------------------------------ |
| -v, --version | Show version number.                 |
| -h, --help    | Show this help message.              |
| -f, --force   | Skip confirmation prompt.            |
| -u, --update  | Update zapdir to the latest version. | --> |

## Features

- Verifies that the target directory exists.
- Prompts for confirmation unless `--force` is used.
- Uses `rsync --delete` to get better performance compared to `rm -rf`.

## Uninstall

```bash
sudo rm /usr/local/bin/zapdir
```

## License

The MIT License (MIT)

## Author

Johan Bjarnle