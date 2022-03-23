echo $1
$1 ; RET=$?; echo RET is $RET; if ! [ "$RET" -eq 2 ] ; then echo ret is not 2 ; else echo ret is 2; fi
