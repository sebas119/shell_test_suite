#!/bin/bash

echo -e "\n########## Task 3  #########\n"

# cases
echo "/bin/ls" | /bin/sh > ../a
echo "/bin/ls" | ./hsh > ../b
diff ../a ../b > ../logs/logs_0
rm ../a
rm ../b
if [ -s ../logs/logs_0 ]
then
	../results/fail_check.sh
else
	rm -rf ../logs/logs_0
	../results/success_check.sh
fi

echo "./hsh: 1: /bin/l: not found" > ../a
echo "/bin/l" | ./hsh 2> ../b
diff ../a ../b > ../logs/logs_1
rm ../a
rm ../b
if [ -s ../logs/logs_1 ]
then
	../results/fail_check.sh
else
	rm -rf ../logs/logs_1
	../results/success_check.sh
fi

echo "./././hsh: 1: /bin/l: not found" > ../a
echo "/bin/l" | ./././hsh 2> ../b
diff ../a ../b > ../logs/logs_2
rm ../a
rm ../b
if [ -s ../logs/logs_2 ]
then
	../results/fail_check.sh
else
	rm -rf ../logs/logs_2
	../results/success_check.sh

fi

touch ../test_ls_2
echo -e "/bin/ls\n/bin/ls" > ../test_ls_2

cat ../test_ls_2 | /bin/sh > ../a
cat ../test_ls_2 | ./hsh > ../b
diff ../a ../b > ../logs/logs_3
rm ../a
rm ../b
if [ -s ../logs/logs_3 ]
then
	../results/fail_check.sh
else
	rm -rf ../logs/logs_3
	rm -rf ../test_ls_2
	../results/success_check.sh

fi
