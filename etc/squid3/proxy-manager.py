#!/usr/bin/env python3
#sudo apt install apache2-utils
import subprocess
import string
import random
import sys
import time
import os
import urllib.request


###############################

def check_ip():

    task = "dig +short myip.opendns.com @resolver1.opendns.com"
    proc = subprocess.Popen(task, shell=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    ext_ip = proc.communicate()[0]
    return ext_ip


server = str(check_ip().decode("utf-8").strip('\n')) + ":8080"

###############################
path = "/etc/squid3/users"
export = "export.txt"


def id_generator(size=6, chars=string.ascii_lowercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

choise = 0

while choise != 4:

    print ("""

    Welcome to proxy manager. Make your choice:

    1. Generate new user list and erase previous list
    2. Add one new user
    3. Delete one existing user
    4. Exit program 

    Type number and press Enter: """)

    choise=input()

    if choise == "1":
        print ("\nHow many users do you want to generate? Type number end press Enter:")
        number=int(input())
        print ("\nHow many symbols do you want to use in username and password? Type from 3 to 8 and press Enter:")
        symbols=int(input())
        print ("\nAttention! Previous user list will be total erased. Type yes and press Enter to continue:")
        yes=input()
        if yes == "yes":
            name = id_generator(symbols)
            passwd = id_generator(symbols)
            task = ("htpasswd -c -b %s %s %s" % (path, name, passwd))
            subprocess.Popen(task, shell=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
            time.sleep(1)
            file = open (export, "w+")
            file.write("%s:%s:%s\n" % (server, name, passwd))
            print("User added: %s:%s:%s" % (server, name, passwd))
            for i in range(number):
                name=id_generator(symbols)
                passwd=id_generator(symbols)
                task = ("htpasswd -b %s %s %s" % (path, name, passwd))
                subprocess.Popen(task, shell=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
                print("User added: %s:%s:%s" % (server, name, passwd))
                file.write("%s:%s:%s\n" % (server, name, passwd))
                time.sleep(1)
            file.close()
            print ("\n-----------------------------------")
            print ("Userlist has been exported to file:", export)
            time.sleep(3)
        else:
            choise = "0"
    elif choise == "2":
        print ("\nType username and press Enter:")
        name=input()
        print ("\nType password and press Enter")
        passwd=input()
        task = ("htpasswd -b %s %s %s" % (path, name, passwd))
        subprocess.Popen(task, shell=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
        print("User added: %s:%s:%s\n" % (server, name, passwd))
        time.sleep(1)
    elif choise == "3":
        print ("\nType username you want to delete and press Enter:")
        name=input()
        #print ("Do some work")
        task = ("htpasswd -D %s %s" % (path, name))
        subprocess.Popen(task, shell=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
        Print ("User deleted:",name)
        time.sleep(1)
    elif choise == "4":
        print("Bye")
        sys.exit()
    else:
        choise=0