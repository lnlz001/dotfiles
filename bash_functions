########################################################################
#
# qfind - used to quickly find files that contain a string in a directory
#
########################################################################
qfind () {
    find . -exec grep -l --no-messages $1 {} \;
    return 0
}

########################################################################
#
# up and down -- moving around quickly in the directory structure
#
########################################################################

# A bash script called up so that if I'm in /a/very/deeply/nested/path/somewhere 
# and I want to go "up" N directories, I can type 'up N'. To go back to where 
# I started I can type 'down N'.

function up( )
{
LIMIT=$1
P=$PWD
for ((i=1; i <= LIMIT; i++))
do
    P=$P/..
done
cd $P
export MPWD=$P
}

function down( )
{
LIMIT=$1
P=$MPWD
for ((i=1; i <= LIMIT; i++))
do
    P=${P%/..}
done
cd $P
export MPWD=$P
}


