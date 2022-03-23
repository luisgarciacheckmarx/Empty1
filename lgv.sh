echo $1
#$1 ; RET=$?; echo RET is $RET; if ! [ "$RET" -eq 2 ] ; then echo ret is not 2 ; else echo ret is 2; fi
$1 ; RET=$?; echo RET is $RET; if [ "$RET" -eq 1 ] ; then exit 55 ; else exit $RET; fi
