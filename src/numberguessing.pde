import random
attempts = 0
print("Welcome to the guessing game! Guess a number between 1 and 100: ")
guess = int(input("Enter A Number: "))
num = random.randint(1, 100)

while guess != num:
    if guess < num:
        guess = int(input(str(guess) + " Too low, Enter another number: "))
        attempts += 1
    else:
        guess = int(input(str(guess) + " Too High, Enter another number: "))
        attempts += 1
else:
  print("You guessed it! " + str(attempts) + " guesses")
