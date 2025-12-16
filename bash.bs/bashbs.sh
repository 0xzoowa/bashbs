#!/bin/bash

pname=$1
pdir="./${pname}"
tdir="/Users/zoowa/Desktop/llp/build-system/bash.bs/templates"
tdir="/var/bash.bs/templates"
usage(){
    >&2 echo "usage: $0 <project>"
    return 0
}


if [ -z "$pname" ]; then
    usage
    exit 1
elif ! [ -d "$tdir" ]; then
    >&2 echo "unable to find template dir: $tdir"
    exit 2
elif [ -d "$pdir" ]; then
    >&2 echo "project directory already exists: $pdir"
    exit 3
fi

cur="$PWD"
cd $tdir

echo "please select a template"
select x in *; do
    template="$x"
    break
done

cd $cur
cp -R ${tdir}/$template $pdir 
cd $pdir
for x in *; do
    new=$(sed "s,PROJECTNAME,$pname,g" <<< "$x")
    if [ "$x" = "$new" ]; then 
        sed "s,PROJECTNAME,$pname,g" < $x > temp 
        mv -f temp $x
    else
        sed "s,PROJECTNAME,$pname,g" < $x > $new 
        if [ -e "$new" ]; then
            rm -f $x
        fi
    fi
done