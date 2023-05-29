[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub release](https://img.shields.io/github/release/AndresCdo/bash-encryption-tool.svg)](https://github.com/AndresCdo/bash-encryption-tool/releases)
[![GitHub issues](https://img.shields.io/github/issues/AndresCdo/bash-encryption-tool.svg)](https://github.com/AndresCdo/bash-encryption-tool/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/AndresCdo/bash-encryption-tool.svg)](https://github.com/AndresCdo/bash-encryption-tool/pulls)
[![GitHub last commit](https://img.shields.io/github/last-commit/AndresCdo/bash-encryption-tool.svg)](https://github.com/AndresCdo/bash-encryption-tool/commits/main)
# Bash Encryption Tool
 The Bash Encryption Toolkit is a command-line tool designed to provide an easy and secure way to encrypt and decrypt folders in Linux environments using the Advanced Encryption Standard (AES) algorithm. With this toolkit, you can safeguard your sensitive data stored in local folders by encrypting them with a strong encryption algorithm and a user-defined passphrase.

## Usage
The Bash Encryption Toolkit is a command-line tool that can be used to encrypt and decrypt folders in Linux environments. The tool is designed to be easy to use and secure. The following sections describe how to use the tool.

### Encrypting a Folder
To encrypt a folder, use the following command:
```bash
./bash_encryption_tool.sh -e <folder_path>
```

This command will encrypt the folder specified by `<folder_path>` and store the encrypted folder in the same directory as the original folder. The encrypted folder will have the same name as the original folder with the `.enc` extension appended to it. For example, if the original folder is named `folder1`, the encrypted folder will be named `folder1.enc`. The binary key file will be stored in the same directory as the encrypted folder and will have the same name as the encrypted folder with the `.key` extension appended to it. For example, if the encrypted folder is named `folder1.enc`, the binary key file will be named `folder1.enc.key`.

### Decrypting a Folder
To decrypt a folder, use the following command:
```bash
./bash_encryption_tool.sh -d <folder_path>
```

This command will decrypt the folder specified by `<folder_path>` and store the decrypted folder in the same directory as the encrypted folder. The decrypted folder will have the same name as the encrypted folder without the `.enc` extension. For example, if the encrypted folder is named `folder1.enc`, the decrypted folder will be named `folder1`. 

## Dependencies
The Bash Encryption Toolkit requires the following dependencies to be installed on the system:

- [GNU Bash](https://www.gnu.org/software/bash/)
- [GNU Core Utilities](https://www.gnu.org/software/coreutils/)
- [OpenSSL](https://www.openssl.org/)
- [GNU Tar](https://www.gnu.org/software/tar/)
- [GNU Gzip](https://www.gnu.org/software/gzip/)

## License
The Bash Encryption Toolkit is licensed under the [MIT License](https://github.com/AndresCdo/bash-encryption-tool/blob/main/LICENSE).

## Author
Andres Caicedo - [AndresCdo](http://github.com/AndresCdo)

## Acknowledgements
- [Advanced Encryption Standard (AES)](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)
- [Bash Scripting Tutorial](https://ryanstutorials.net/bash-scripting-tutorial/)
- [Bash Scripting Cheat Sheet](https://devhints.io/bash)
- [Bash Scripting Best Practices](https://kvz.io/bash-best-practices.html)
- [Bash Scripting Style Guide](https://google.github.io/styleguide/shellguide.html)
