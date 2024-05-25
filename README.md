# BSides-CodeQL101

# Setup Instructions

## Stuff to Download
 - Install VSCode and git
 - Install VSCode extension for CodeQL
 - Download the latest [CodeQL Binary](https://github.com/github/codeql-cli-binaries/releases) for your system
 - Add the unzipped "codeql" folder from the above step to your PATH environment variable

## Set up the CodeQL submodule
Run the following commands to retrieve the codeql submodule that contains the libraries/queries from the github codeql repository:

```
cd BSides-CodeQL101
git submodule init
git submodule update
```

## Creating a CodeQL Database
- clone the [sample project repo](https://github.com/chanel-y/BSides-Sample-Project)
- run `codeql database create --language=csharp --source-root=<path to sample project>/BSides-Sample-Project sample_project_db`

# Using this Workshop
This repository contains starter query files and docs for the CodeQL Workshop at BSides Vancouver 2024. 

If you're following along outside of the workshop, start with the README files in each part in the queries/csharp folder. Please do these in order, as some of the exercises build on ones from previous sections. 

Solutions to these exercises are available in the solutions folder, but please first try them on your own. Keep in mind that there are multiple ways to write a query - each of these solutions is only one way to solve the exercises. 

# Useful Resources
 - [Github documentation for CodeQL](https://codeql.github.com/)
 - [QL Language Reference](https://codeql.github.com/docs/ql-language-reference/)
