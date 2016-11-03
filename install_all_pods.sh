dirs=$(find . -name Podfile -print0 | xargs -0 -n1 dirname | sort --unique)

top=$(pwd)

for dir in $dirs
do
    cd "$dir"
    pod install
    cd "$top"
done
