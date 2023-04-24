#!/bin/bash
function usage() {
    echo "Usage: $0 K";
    echo "       K constant to check collatz conjecture";
}

if [ $# -eq 1 ]; then
    K=$1
else    
    usage
    exit 1
fi

echo "system:collatz_$K"

echo "


clock:prophecy:n
clock:prophecy:n1
clock:prophecy:n2
clock:normal:g
clock:prophecy:t1
clock:prophecy:t2



event:a


process:P
location:P:q0{initial:}
location:P:q1{}
location:P:q2{}
location:P:q3{}
location:P:qf{labels:green}

edge:P:q0:q1:a{{ provided:g==0; do:n; provided:n==-$K;}}

edge:P:q1:q2:a{{ provided:g==0; do:n1,n2; provided: n1-n==0 && n2-n==0;}}
edge:P:q2:q2:a{{ provided:g==0; do:t1,t2; provided: t1-n1==0 && t2-n2==0; do:n1,n2; provided: t1-n1==-1 && t2-n2==-2;}}
edge:P:q2:q1:a{{ provided:g==0 && n2==0; do:n; provided: n1-n==0;}}

edge:P:q2:q3:a{{ provided:g==0 && n2==-1; do:n1,n2; provided: n1-n==0 && n2==0;}}
edge:P:q3:q3:a{{ provided:g==0; do:t1,t2; provided: n1-t1==0 && n2-t2==0; do:n1,n2; provided: t1-n1==1 && t2-n2==3;}}
edge:P:q3:q1:a{{ provided:g==0 && n2==0; do:n; provided: n-n1==-1;}}


edge:P:q1:qf:a{{provided:g==0 && n==-1;}}
edge:P:qf:qf:a{{provided:g==0;do:n,n1,n2,t1,t2;}}
"
