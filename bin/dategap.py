#!/usr/bin/python
# simple helper script to give me the days or weeks between two dates of format dd/mm/yyyy
#

import sys
from datetime import datetime, date

date_format = '%m/%d/%Y'

def helpmsg() -> str:
    msg = "Usage: datagap.py <startdate> <enddate> <periodicity>\n"
    msg += (" where startdate and enddate in mm/dd/yyyy format\n")
    msg += " and periodicity is [weeks] or [days]"
    return msg

def defaulterror() -> str:
    msg = "Error: Requires 3 args"
    return msg

def validateDate(arg: str) -> bool:
    if (len(arg) != 10):
        return False
    else:
        datet = datetime.strptime(arg, date_format)
        return True
    
def validatePeriodicity(arg: str) -> bool:
    if ((arg == "days") or (arg == "weeks")):
        return True
    else:
        return False
    
def daysBetween(x: str, y: str) -> datetime:    
    if (validateDate(x) and validateDate(y)):
        daysb = datetime.strptime(y, date_format) - datetime.strptime(x, date_format)
    return daysb

def weeksBetween(x: str, y: str) -> float:
    weeksb = daysBetween(x, y)/7
    return weeksb

def main():
    args = len(sys.argv) - 1
    
    if(args == 0):
        print(defaulterror())
        print(helpmsg())

    elif(args == 1):
        if((sys.argv[1] == "-h") or (sys.argv[1] == "-help")):
            print(helpmsg())

    elif(args == 3):
        arg1 = sys.argv[1]
        arg2 = sys.argv[2]
        arg3 = sys.argv[3]
        
        if(validateDate(arg1) and validateDate(arg2) and validatePeriodicity(arg3)):
            daysint = daysBetween(arg2, arg1)
            weeksb = weeksBetween(arg2, arg1)
            
            print(daysint.days, "days")

        else:
            print(defaulterror())
            print(helpmsg())
            
    else:
        print(defaulterror())
        print(helpmsg())
     

if __name__ == "__main__":
    main()





    

