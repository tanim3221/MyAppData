import os

# Ask for the location of the input TXT file
input_location = input("Enter the location of the input TXT file: ")

# List the files in the specified location
file_list = os.listdir(input_location)

# Display the list of file names
print("Available files:")
for index, filename in enumerate(file_list):
    print(f"{index}: {filename}")

# Ask the user to select a file by index number
selected_index = int(input("Enter the index number of the file you want to process: "))
selected_filename = file_list[selected_index]

# Construct the full path of the selected file
selected_file_path = os.path.join(input_location, selected_filename)

# Read the main text from the selected file
with open(selected_file_path, "r", encoding="utf-8") as input_file:
    main_text = input_file.read()

# Split the main text into words
words = main_text.split()

# Write the words to an output TXT file
output_filename = f"{selected_filename.split('.')[0]}_output.txt"
output_file_path = os.path.join(input_location, output_filename)
with open(output_file_path, "w") as output_file:
    for word in words:
        output_file.write(word + "\n")

print("Words extracted and saved to", output_filename)
