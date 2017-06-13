read -p "FIRST ADDITION OF THE DAY? (y/n) "

    if [ $(date +%u) = 1 ] && [ $REPLY = "y" ] ;
    then
        echo clearing 
        > toDo.txt
    fi

    while [ "$REPLY" != "exit" ];
    do
        read -p "TODO: "
        if [ "$REPLY" != "exit" ] && [ "$REPLY" != "y" ] \
        && [ "$REPLY" != "n" ] && [ "$REPLY" != "clear" ]
        then
            echo "HERE"
            echo $REPLY >> toDo.txt
        elif [ "$REPLY" = "clear" ]
        then
            echo clearing
            > toDo.txt
        fi
    done
    echo "-------" >> toDo.txt

read -p "Send Mail? (y/n): "
if [ "$REPLY" = "y" ]
then
    uuencode toDo.txt toDo.txt | mail -s "Updated Weekly Todo List" #EMAIL HERE
else
    cat toDo.txt
fi
