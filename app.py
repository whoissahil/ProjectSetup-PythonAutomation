import os
import sys
from github import Github

username = "{{YOUR_GITHUB_USERNAME}}" #Insert your github username here 
password = "{{YOUR_GITHUB_PASSWORD}}" #Insert your github password here 
 
projectName = sys.argv[1] #Takes In-Line Argument

path = "{{YOUR_DIRECTORY_PATH}}" #Insert your path here 


def create():
    try:
        os.makedirs(path + str(projectName)) #Create target Directory
        print("Directory " , projectName ,  " Created ") 
    except FileExistsError:
        print("Directory " , projectName ,  " already exists")        
    create_repo_on_github()

def create_repo_on_github():
    user = Github(username, password).get_user() #Get user Authentication
    repo = user.create_repo(projectName) #Create a new Repo on Github
    print("Succesfully created repository {}".format(projectName))  

if __name__ == '__main__':
    create()
