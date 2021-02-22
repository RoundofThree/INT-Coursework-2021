cd `dirname $0`
x=1
while [ -f ./problem_$x.pddl ]
do
  echo Executing Problem $x >> ../out.txt
  echo '\n\n' >> ../out.txt
  echo '```' >> ../out.txt
  # Note -x600 indicates a 600sec time execution cap, if you lift this, GitHub Actions might freak out
  optic -x600 ./domain.pddl ./problem_$x.pddl >> ../out.txt
  echo '```' >> ../out.txt
  echo '\n\n' >> ../out.txt
  x=$(( $x + 1 ))
done