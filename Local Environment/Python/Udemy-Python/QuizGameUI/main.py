from data import Data
from question_model import Question
from quiz_brain import QuizBrain
from ui import QuizInterface


api_q = Data()

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
quiz_ui = QuizInterface(quiz)