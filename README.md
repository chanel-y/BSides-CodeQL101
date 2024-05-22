# BSides-CodeQL101
Starter Query Files and Docs for CodeQL Workshop for BSides Vancouver 2024

# Setup Instructions

## Prerequisites
 - Install VSCode and git
 - Install VSCode extension for CodeQL
 - Download the latest [CodeQL Binary](https://github.com/github/codeql-cli-binaries/releases) for your system
 - Add the unzipped "codeql" folder from the above step to your PATH environment variable

## Creating a CodeQL Database
 - clone the [sample project repo](https://github.com/chanel-y/BSides-Sample-Project)
- run `codeql database create --language=csharp --source-root=BSides-Sample-Project sample_project_db`


## Useful Resources
 - [Github documentation for CodeQL](https://codeql.github.com/)
 - [QL Language Reference](https://codeql.github.com/docs/ql-language-reference/)
