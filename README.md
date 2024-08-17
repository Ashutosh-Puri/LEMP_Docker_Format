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


# Running on Different Platforms

## Unix-like Systems (macOS, Linux)
  1. Open Terminal.
Navigate to the Project Directory:
``bash
cd path/to/LEMP_Stack_Docker_Directory_Structure_Creator
Make the Script Executable:
bash
Copy code
chmod +x create_project.sh
Run the Script:
bash
Copy code
./create_project.sh <project_name>
