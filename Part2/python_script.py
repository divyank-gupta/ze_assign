from pssh.clients import ParallelSSHClient

def execute_command(client,cmd):
    try:
        shells = client.open_shell()
    except:
        print("[!] Cannot connect to the SSH Server, Check you credentials")
        exit()
    client.run_shell_commands(shells, cmd)
    client.join_shells(shells)
    for shell in shells:
        stdout = list(shell.stdout)
        print(stdout)
        exit_code = shell.exit_code

def accept_user_input():
    hosts = ['13.126.230.143', '65.0.3.41']
    client = ParallelSSHClient(hosts, user='ec2-user', password=None, port=22, pkey='C:/Users/Divyansh/Desktop/Divyansh/Scripts/RemoteConnection/divyansh-test.pem')
    while(True):
        cmd = input('Enter command to be executed over remote machines: ')
        execute_command(client,cmd)
        proceed = input('Do you want to execute more commands over remote machines? (Yes/No) ')
        if proceed != 'Yes':
            if proceed != 'No':
                print('Wrong Input! Exiting Script')
            break

accept_user_input()