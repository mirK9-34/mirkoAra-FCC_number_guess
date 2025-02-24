#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "Enter your username:\n"
read USERNAME

USERNAME_AVAILABLE=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME';")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE username = '$USERNAME';")
BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM users INNER JOIN games USING(user_id) WHERE username = '$USERNAME';")
if [[ -z $USERNAME_AVAILABLE ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
else 
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUM=$((1 + $RANDOM % 1000))
GUESS=1
echo -e "Guess the secret number between 1 and 1000:\n"
while read NUM
do 
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:\n"
  else
    if [[ $NUM -eq $RANDOM_NUM ]]
    then
      break;
    else 
      if [[ $NUM -gt $RANDOM_NUM ]]
      then
        echo -e "It's lower than that, guess again:\n"
      elif  [[ $NUM -lt $RANDOM_NUM ]]
      then
        echo -e "It's higher than that, guess again:\n"
      fi
    fi
  fi
  GUESS=$(( $GUESS + 1))
done

if [[ $GUESS == 1 ]]
then
  echo -e "You guessed it in $GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
else
  echo -e "You guessed it in $GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
INSERT_GAME=$($PSQL "INSERT INTO games(number_guesses, user_id) VALUES($GUESS, $USER_ID);")
