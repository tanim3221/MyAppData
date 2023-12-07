PLACEHOLDER = "[name]"

with open("./Input/Names/invited_names.txt") as names:
    names = names.readlines()

with open("./Input/Letters/starting_letter.txt") as letter:
    letter = letter.read()
    for name in names:
        stripped_name = name.strip()
        new_letter =  letter.replace(PLACEHOLDER,stripped_name)
        with open(f"./Output/ReadyToSend/letter_for_{stripped_name}", mode="w") as final_letter:
            final_letter.write(new_letter)


