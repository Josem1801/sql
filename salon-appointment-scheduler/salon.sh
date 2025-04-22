#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"




MAIN_MENU(){ 

  echo -e '\n~~~~ MY SALON ~~~~\n'

  echo -e "Welcome to My Salon, how can I help you?"
} 

SHOW_SERVICES () { 
  if [[ $1 ]] 
  then 
    echo -e '\n'$1
  fi

  SERVICES=$($PSQL "SELECT * FROM services")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do 
    echo "$SERVICE_ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED

  #service not exist
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE_NAME ]]
  then 
    SHOW_SERVICES "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    if [[ -z $CUSTOMER_NAME ]] 
    then 
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      INSERT_NAME_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

      SERVICE_NAME_FORMATTED=$(echo "$SERVICE_NAME" | sed -r 's/^ *| *$//g')
      CUSTOMER_NAME_FORMATTED=$(echo "$CUSTOMER_NAME" | sed -r 's/^ *| *$//g')
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
      read SERVICE_TIME

      INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED.\n"
  fi

} 

MAIN_MENU 
SHOW_SERVICES






