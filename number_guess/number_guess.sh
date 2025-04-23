#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

MIN=1
MAX=1000
TRIES=1
RANDOM_NUMBER=$(( ($RANDOM % $MAX) + $MIN ))

MAIN() { 
  # PROMPT THE USER
  echo 'Enter your username:'
  read USERNAME

  # GET USERNAME INFORMATION

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  
  if [[ -n $USER_ID ]] 
  then 
    # EXISTING USER
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users LEFT JOIN games USING(user_id) WHERE username = '$USERNAME'")
    BEST_GAME_TRIES=$($PSQL "SELECT MIN(attemps) FROM users LEFT JOIN games USING(user_id) WHERE username = '$USERNAME'")
    echo 
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_TRIES guesses."
  else 
    # NEW USER
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  fi

  #START
  echo -e "\nGuess the secret number between 1 and 1000:"

  # FUNCTION TO GUESS NUMBER
  GUESS_NUMBER

  # SAVE DATA
  INSERT_GAME=$($PSQL "INSERT INTO games(attemps, user_id) VALUES($TRIES, $USER_ID)")
  echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"

}


GUESS_NUMBER()  {
  read NUMBER

  # should be a number
  if [[ $NUMBER =~ ^[0-9]*$ ]] 
  then 
    if [[ $NUMBER != $RANDOM_NUMBER ]] 
    then 
      if [[ $NUMBER -gt $RANDOM_NUMBER ]] 
      then 
        echo -e "\nIt's lower than that, guess again:"
        (( TRIES++ )) 
        GUESS_NUMBER
      elif [[ $NUMBER -lt $RANDOM_NUMBER ]] 
      then
        echo -e "\nIt's higher than that, guess again:"
        (( TRIES++ )) 
        GUESS_NUMBER
      fi
    fi
  else 
    echo That is not an integer, guess again:
    (( TRIES++ )) 
    GUESS_NUMBER
  fi

}

MAIN