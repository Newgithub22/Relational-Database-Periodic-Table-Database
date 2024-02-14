PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then  echo "Please provide an element as an argument."
else
    if [[ $1 =~ ^[0-9]+$ ]]
    then 
        ATOMIC_NUMBER=$(echo $($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1") | tr -d ' ')
        if [[ -z $ATOMIC_NUMBER ]]
        then 
            echo "I could not find that element in the database."
        else
            NAME=$(echo $($PSQL "SELECT name FROM elements WHERE atomic_number=$1") | tr -d ' ')
            SYMBOL=$(echo $($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1") | tr -d ' ')
            TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$1")
            TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID") | tr -d ' ')
            ATOMIC_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$1") | tr -d ' ')
            MELTING_POINT_CELSIUS=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$1") | tr -d ' ')
            BOILING_POINT_CELSIUS=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$1") | tr -d ' ')
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        fi
    fi
    strg=$1
    if [[ $1 =~ ^[A-Z][a-z]*$ && ${#strg} < 3 ]]
    then
        ATOMIC_NUMBER=$(echo $($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'") | tr -d ' ')
        if [[ -z $ATOMIC_NUMBER ]]
        then 
            echo "I could not find that element in the database."
        else
            NAME=$(echo $($PSQL "SELECT name FROM elements WHERE symbol='$1'") | tr -d ' ')
            SYMBOL=$(echo $($PSQL "SELECT symbol FROM elements WHERE symbol='$1'") | tr -d ' ')
            TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID") | tr -d ' ')
            ATOMIC_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER") | tr -d ' ')
            MELTING_POINT_CELSIUS=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER") | tr -d ' ')
            BOILING_POINT_CELSIUS=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER") | tr -d ' ')
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        fi
    fi
    
    if [[ ${#strg} > 2 ]] 
    then
        ATOMIC_NUMBER=$(echo $($PSQL "SELECT atomic_number FROM elements WHERE name='$strg'") | tr -d ' ')
        if [[ -z $ATOMIC_NUMBER ]]
        then 
            echo "I could not find that element in the database."
        else
            NAME=$(echo $($PSQL "SELECT name FROM elements WHERE name='$strg'") | tr -d ' ')
            SYMBOL=$(echo $($PSQL "SELECT symbol FROM elements WHERE name='$strg'") | tr -d ' ')
            TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID") | tr -d ' ')
            ATOMIC_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER") | tr -d ' ')
            MELTING_POINT_CELSIUS=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER") | tr -d ' ')
            BOILING_POINT_CELSIUS=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER") | tr -d ' ')
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        fi
    fi

fi