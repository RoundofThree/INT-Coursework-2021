#! /bin/bash
x=1
while [ -f ./problem_$x.pddl ]
do
  echo Executing Problem $x 
  echo '\n\n' 
  echo '```' 
  # Note -x600 indicates a 600sec time execution cap, if you lift this, GitHub Actions might freak out
  optic -N -x600 ./domain.pddl ./problem_$x.pddl 
  echo '```'
  echo '\n\n'
  x=$(( $x + 1 ))
done