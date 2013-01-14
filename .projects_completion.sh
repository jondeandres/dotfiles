export PROJECTS=~/wuaki/

function cs {
        local dest current
 
        mkdir -p "$PROJECTS"
        cd "$PROJECTS/$1"
}
 
function _cs_scandir
{
        local base ext
 
        base=$1
        if [ -d $base ]; then
                for d in `ls $base`; do
                        if [ -d $base/$d ]; then
                                dirs="$dirs $d"
                        fi
                done
        fi
}
 
function _cs()
{
        local cur dirs
        _cs_scandir "$PROJECTS"
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "${dirs}" -- ${cur}) )
}
 
complete -F _cs cs
