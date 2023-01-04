import hello
import sys

if len(sys.argv) != 2:
    print("The \"person name\" path parameter should be provided.") 
    sys.exit(1)

personName = sys.argv[1]

print(hello.format(personName))
