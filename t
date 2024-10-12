#!/bin/sh
# create session like zoxide cmd using zoxide and tmux

#store pwd in zoxide
ZOXIDE_RESULT=$(zoxide query $1)


# if input is empty return
if [ -z "$1" ]
then
    ts
    exit 0
fi

#if empty, exit
if [ -z "$ZOXIDE_RESULT" ]
then
    echo "No match found"
    exit 0
fi

# get folder name
FOLDER=$(basename $ZOXIDE_RESULT)
echo $FOLDER


# lookup tmux seession name
SESSION=$(tmux ls |  grep $FOLDER | awk '{print $1}')
SESSION=${SESSION//:/}



# check if variable is empty
# if not currently in tmux 
if [ ! "$TMUX" ]; then
    # tmux is not active
    echo 'is not tmux'
    if [ -z "$SESSION" ]; then
        # session is not active
        echo 'session does not exists'
        # jump to folder
        echo $FOLDER
        cd $ZOXIDE_RESULT
        # create session
        tmux new-session -s $FOLDER
        # attach to session
        # tmux switch-client -t $FOLDER
    else
        # session is active
        echo 'session exists'
        # attach to session
        tmux attach -t $SESSION
    fi
else
    # tmux is active
    echo 'tmux is active'
    # check if session is active
    if [ -z "$SESSION" ]; then
        # session is not active
        echo 'session does not exists'
        # echo $FOLDER
        # jump to folder
        cd $ZOXIDE_RESULT
        # create session
        tmux new-session -d -s $FOLDER
        tmux switch-client -t $FOLDER
    else
        # session is active
        echo 'session exists'
        # switch to session
        tmux switch-client -t $SESSION
    fi
fi


