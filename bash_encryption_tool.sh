#!/bin/bash
set -e

# Choose encryption algorithm
algorithm="aes-256-cbc"

# Define iteration count
iter=10000

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 [-e|-d] folder_name" >&2
    exit 1
fi

option=$1
folder_name=$2


if [[ $option == '-e' ]]; then

    if [[ ! -d $folder_name ]]; then
        echo "Error: Folder does not exist." >&2
        exit 1
    fi

    if [[ -z $(ls -A "$folder_name") ]]; then
        echo "Error: Folder is empty." >&2
        exit 1
    fi

    if [[ -f "$folder_name.tar.gz.enc" ]]; then
        echo "Error: Folder is already encrypted." >&2
        exit 1
    fi

    if [[ -f "keyfile" ]]; then
        echo "Error: Encryption key already exists." >&2
        exit 1
    fi

    umask 0077
    openssl rand -hex 64 | xxd -r -p > "${folder_name}.enc.key"
    tar czf - -C "$folder_name" . | openssl enc -$algorithm -salt -pbkdf2 -iter $iter -out "$folder_name.tar.gz.enc" -pass file:"${folder_name}.enc.key"
    rm -r "$folder_name"
    # shred -fuz keyfile

elif [[ $option == '-d' ]]; then

    if [[ -d $folder_name ]]; then
        echo "Error: Folder already exists." >&2
        exit 1
    fi

    if [[ ! -f "$folder_name.tar.gz.enc" ]]; then
        echo "Error: Encrypted folder does not exist." >&2
        exit 1
    fi

    if [[ ! -f "${folder_name}.enc.key" ]]; then
        echo "Error: Encryption key does not exist." >&2
        exit 1
    fi

    openssl enc -$algorithm -d -salt -pbkdf2 -iter $iter -in "$folder_name.tar.gz.enc" -out "$folder_name.tar.gz" -pass file:"${folder_name}.enc.key"
    mkdir "$folder_name" && tar xzf "$folder_name.tar.gz" -C "$folder_name"
    rm "$folder_name.tar.gz" "$folder_name.tar.gz.enc" "${folder_name}.enc.key"
else
    echo "Error: Invalid option. Use -e for encrypt or -d for decrypt." >&2
    exit 1
fi
