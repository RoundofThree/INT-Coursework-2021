# coding: utf-8

import openpyxl
wb = openpyxl.load_workbook("problem.xlsx")
f = "problem_9.pddl"

sh = wb['Sheet1']
row = 7 # sh['B1'].value
col = 8 # sh['B2'].value

time = sh['B3'].value
bombs = sh['B4'].value
pliers = sh['B5'].value


colList = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','aa','ab','ac','ad']

sokoban = wb['p169steps']


with open(f,"w") as file: 
    file.write("(define (problem p169steps)\n    (:domain sokoban)\n    (:objects\n")
    # objects
    numOfBoxes = 0
    for m in range(col):
        p = colList[m]
        file.write("        ")
        for i in range(1,row+1):
            file.write("sq-"+p+str(i)+" ")
            if sokoban[p+str(i)].value == 2 or sokoban[p+str(i)].value ==6:
                numOfBoxes += 1
        file.write("- square\n")
    file.write("        ")
    for i in range(1, numOfBoxes+1):
        file.write("b"+str(i)+" ")
    file.write("- box\n    )\n\n")
    
    # init
    file.write("    (:init\n\n")
    # above
    for m in range(col):
        p = colList[m]
        for i in range(1,row):
            file.write("        (above sq-"+p+str(i)+" sq-"+p+str(i+1)+")\n")
    
    file.write("\n")
    
    # left-to
    for m in range(col-1):
        p = colList[m]
        q = colList[m+1]
        for i in range(1, row+1):
            file.write("        (left-to sq-"+p+str(i)+" sq-"+q+str(i)+")\n")
    
    file.write("\n")
    
    # box-at
    box = 0
    bSet = set()
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value == 2 or sokoban[p+str(i)].value ==6:
                box +=1
                file.write("        (box-at b"+str(box)+" sq-"+p+str(i)+")\n")
                if sokoban[p+str(i)].value ==6:
                    bSet.add(box)
    
    file.write("\n")
    
    # hole-at
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value == 5 or sokoban[p+str(i)].value ==6:
                file.write("        (hole-at sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # no-hole-at
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value != 5 and sokoban[p+str(i)].value !=6:
                file.write("        (no-hole-at sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # is-free
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value != 1 and sokoban[p+str(i)].value != 2 and sokoban[p+str(i)].value != 4 and sokoban[p+str(i)].value != 6:
                file.write("        (is-free sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # is-wall
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value == 1:
                file.write("        (is-wall sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # bomb-at
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value == 8:
                file.write("        (bomb-at sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # coin-at
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value == 9:
                file.write("        (coin-at sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # player-at
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value == 4:
                file.write("        (player-at p1 sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # trampoline-at
    has_trampoline = False
    for m in range(col):
        p = colList[m]
        for i in range(1, row+1):
            if sokoban[p+str(i)].value == 7:
                has_trampoline = True
                file.write("        (trampoline-at sq-"+p+str(i)+")\n")
    
    file.write("\n")
    
    # collected-box
    for i in bSet:
        file.write("        (collected-box b"+str(i)+")\n")
        
    file.write("\n")
    
    if has_trampoline:
        file.write("        (has-trampoline)\n")
    else:
        file.write("        (has-no-trampoline)\n")
    
    file.write("        (= (time) "+str(time)+")\n")
    file.write("        (= (collected-coins) 0)\n")
    file.write("        (= (bombs-available p1) "+str(bombs)+")\n")
    file.write("        (= (pliers-available p1) "+str(pliers)+")\n")
    
    file.write("    )\n")
    
    # goal
    file.write("    (:goal\n        (and\n")
    for i in range(numOfBoxes):
        file.write("            (collected-box b"+str(i+1)+")\n")
    file.write("        )\n    )\n")
    
    # metric 略,这个还是自己手动加吧！
    file.write(")")
    