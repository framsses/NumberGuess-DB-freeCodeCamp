#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# Add counter
COUNT=0

# Ask for username
echo Enter your username:
read USERNAME

PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name = '$USERNAME'")

if [[ -z $PLAYER_ID ]]
then
  # Comment for the first time
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  
  # Insert new player
  INSERT_PLAYER_NAME=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME')")
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE player_id = $PLAYER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_id = $PLAYER_ID")

  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Ask for a number between 1 and 1000
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS != $SECRET_NUMBER ]]
do
  
  if [[ $GUESS -gt $SECRET_NUMBER && $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nIt's lower than that, guess again:"


  elif [[ $GUESS -lt $SECRET_NUMBER && $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nIt's higher than that, guess again:"


  else

    echo -e "\nThat is not an integer, guess again:"
  fi

  read GUESS
  ((COUNT++))
done

echo -e "\nYou guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

if [[ $COUNT -lt $BEST_GAME || -z $BEST_GAME ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE players SET best_game = $COUNT WHERE player_id = $PLAYER_ID")
fi

UPDATE_GAMES_RESULT=$($PSQL "UPDATE players SET games_played = games_played + 1 WHERE player_id=$PLAYER_ID")
