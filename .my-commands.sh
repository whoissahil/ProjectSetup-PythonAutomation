#!/bin/bash

function create() {
    pip3 install -r ./global-requirements.txt # Install the Requirements globally
    python3 ./app.py $1 # Run the Python Program
    cd {{YOUR_DIRECTORY_PATH}}/$1 # Change Directory to the Directory Created 
    python3 -m pip install virtualenv # Install Virtualvenv
    python3 -m virtualenv venv # Create a new Virtualenv
    source venv/bin/activate # Activate the venv
    cp {{THIS_FOLDER_PATH}}/common-requirements.txt ./ # Copy the requiremenmts 
    pip3 install -r ./common-requirements.txt # Install the Requirements you 
    git init # Initilize Git
    git remote add origin https://github.com/{{YOUR_GITHUB_USERNAME}}/$1.git # Add Git Origin
    echo "# demo" >> README.md # Create Readme
    echo "venv" >> .gitignore # Add venv to gitignore
    git add . # Add all the files to Git
    git commit -m "Initial commit" # Commit the changes
    git push -u origin master # Push the changes
    code . # Open VS Code
}