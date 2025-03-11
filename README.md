# ESP-TOOLS
Tools required for development with ESP-IDF environment

## How to Use

Clone the repository and switch to adequate release tag. Then, run the script to download ESP-TOOLS:

```
scripts\get-tools.cmd
```

for Windows, and

```
scripts/get-tools.sh
```

for Linux.

> [!NOTE]
> The scripts mentioned above assumes that you have `curl` and `tar` tools installed in Windows, or alternatively, `wget` and `tar` tools installed
> in Linux environment.

After the tools are downloaded, you can run the test scripts to verify that everything works as expected.

```
scripts\test.cmd version
```

for Windows, and

```
scripts/test.sh version
```

for Linux.

## Compatibility Matrix

The version compatibility of ESP-TOOLS with ESP-IDF is documented in the matrix shown below. Please make sure to checkout the correct release tag of the
ESP-TOOLS when using it with the listed ESP-IDF versions.

| ESP-TOOLS      | ESP-IDF   |
| :------------: | :-------: |
| v1.0.0         | v5.4      |
