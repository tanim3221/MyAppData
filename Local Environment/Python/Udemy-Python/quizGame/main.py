from data import Data
from question_model import Question
from quiz_brain import QuizBrain

q_type = input("Enter question category (17: Science and Nature; 18: Technology): ")
q_level = input("Question level (Easy/Medium/Hard): ")

api_q = Data(f"https://opentdb.com/api.php?amount=10&category={q_type}&difficulty={q_level}&type=boolean")

data = api_q.get_questions()
questions = data['results']
question_data = []
for q in questions:
    question_data.append({
        "text":q['question'],
        "answer":q['correct_answer']
    })

question_bank = []
for question in question_data:
    question_text = question['text']
    question_answer = question['answer']
    new_question = Question(question_text,question_answer)
    question_bank.append(new_question)

quiz = QuizBrain(question_bank)

while quiz.still_has_questions():
    quiz.next_question()

print("You have completed the quiz.")
print(f"Your final score was: {quiz.score}/{quiz.question_number}.")