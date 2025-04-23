
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


FORMAT_RESULT(){ 
  echo "$1" | while IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MPC BPC
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
  done
}

NOT_FOUND() { 
  echo "I could not find that element in the database."
}

if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
else 
  if [[ $1 =~ ^[0-9]+$  ]]
  then
    # SEARCH BY NUMBER
    INFO_BY_NUMBER=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number = $1")    

    #IF NOT FOUND
    if [[ -z $INFO_BY_NUMBER ]]
    then
      NOT_FOUND
    else
      FORMAT_RESULT $INFO_BY_NUMBER
    fi
  else 
    #SEARCH BY SYMBOL
    INFO_BY_SYMBOL=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol = '$1'")    
    
    #IF NOT FOUND
    if [[ -z $INFO_BY_SYMBOL ]] 
    then 
      #SEARCH BY NAME
      INFO_BY_NAME=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name = '$1'")    
      
      #IF NOT FOUND
      if [[ -z $INFO_BY_NAME ]] 
      then 
        NOT_FOUND 
      else
        FORMAT_RESULT $INFO_BY_NAME
      fi
    else 
      FORMAT_RESULT $INFO_BY_SYMBOL
    fi
  fi
fi


