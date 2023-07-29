# Generate and print all possible three-digit combinations without repetition
for digit1 in range(10):
    for digit2 in range(10):
        for digit3 in range(10):
            # Skip combinations with repeated digits
            if digit1 != digit2 and digit1 != digit3 and digit2 != digit3:
                combination = f"{digit1}{digit2}{digit3}"
                print(combination)
