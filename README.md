# LEMP Stack Docker Directory Structure Creator

## Overview

This repository provides a shell script to create a directory structure for a LEMP stack (Linux, Nginx, MySQL, PHP) Docker setup. The script also generates the necessary Docker configuration files, including Docker Compose and Dockerfiles for PHP and Nginx.

## Features

- Creates project directories and default files for a LEMP stack.
- Generates Docker Compose file for setting up the LEMP stack.
- Generates Dockerfiles for PHP and Nginx.

## Prerequisites

- [Docker](https://www.docker.com/get-started) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed
- [Bash](https://www.gnu.org/software/bash/) (or any Unix-like shell) available

## Usage

### Clone the Repository

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/LEMP_Stack_Docker_Directory_Structure_Creator.git
   cd LEMP_Stack_Docker_Directory_Structure_Creator
   ```

# Running on Different Platforms

## Unix-like Systems (macOS, Linux)
  1. Open Terminal.

  2. Navigate to the Project Directory:
      ```bash
         cd path/to/LEMP_Stack_Docker_Directory_Structure_Creator
      ```
   3. Make the Script Executable:
   ```bash
      chmod +x new.sh
   ```

   4. Run the Script:
   ```bash
      ./new.sh <project_name>
   ```
## Windows
### Using Git Bash
1. Install Git Bash if not already installed: Download Git Bash
2. Open Git Bash.
3. Navigate to the Project Directory:
```bash
cd /c/path/to/LEMP_Stack_Docker_Directory_Structure_Creator
```
4. Make the Script Executable (Optional, Git Bash may not require this):
```bash
chmod +x new.sh
```
5. Run the Script:
```bash
./new.sh <project_name>
```
### Using Windows Subsystem for Linux (WSL)
1. Install WSL if not already installed: Install WSL
2. Open WSL Terminal.
3. Navigate to the Project Directory:
```bash
cd /mnt/c/path/to/LEMP_Stack_Docker_Directory_Structure_Creator
```
4. Make the Script Executable:
```bash
chmod +x new.sh
```
5. Run the Script:
```bash
./new.sh <project_name>
```
# Files Created
## docker-compose.yml: Configuration for Docker Compose to set up PHP, Nginx, MySQL, and phpMyAdmin services.
## php/Dockerfile: Dockerfile to build the PHP image.
## nginx/default.conf: Nginx configuration file to set up the server.
## create_project.sh: Shell script to create the directory structure and configuration files.
## .gitignore: Specifies files and directories to ignore in Git.
## README.md: Documentation file with usage instructions and file descriptions.

