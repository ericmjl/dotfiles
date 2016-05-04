import os

github = os.environ['github']

os.chdir('{0}'.format(github))
print(os.listdir(os.getcwd()))

for f in os.listdir(os.getcwd()):
    p = os.path.join(github, f)
    if os.path.isdir(p):
        print('Currently in directory {0}'.format(p))
        os.chdir(p)
        os.system('git pull')
        os.system('git add .')
        os.system('git commit -m "en masse update"')
        os.system('git push')
        os.chdir('..')
