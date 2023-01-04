import termcolor

def format(personName):
  return (termcolor.colored("(Python) ", "white") +
    termcolor.colored("Hello ", "blue") +
    termcolor.colored(personName, "red") +
    termcolor.colored("!", "blue"))
