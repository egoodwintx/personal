#!/usr/bin/python
# simple helper script to give me the days or weeks between two dates of format dd/mm/yyyy
#

import sys

def helpmsg() -> str:
    msg = "Usage: datagap.py <startdate> <enddate> <periodicity>\n"
    msg += (" where startdate and enddate in dd/mm/yyyy format\n")
    msg += " and periodicity is [weeks] or [days]"
    return msg

def defaulterror() -> str:
    msg = "Error: Requires 3 args"
    return msg

def main():
    args = len(sys.argv) - 1
    
    if(args == 0):
        print(defaulterror())
        print(helpmsg())

    elif(args == 1):
        if((sys.argv[1] == "-h") or (sys.argv[1] == "-help")):
            print(helpmsg())

    elif(args == 3):
        print("Success")

    else:
        print(defaulterror())
        print(helpmsg())
     

if __name__ == "__main__":
    main()





    

