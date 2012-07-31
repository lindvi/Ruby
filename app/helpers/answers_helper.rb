module AnswersHelper
	def new_button_to_answer(question_id, answer_id, remember_token, text)
		link_to text, answers_path(question_id: question_id, answer_id: answer_id, remember_token:remember_token), :method => :post, class:"btn btn-small btn-primary"
	end

	def button_to_answer(user_id, question_id, answer_id, remember_token, text)
  			link_to text, answers_path(user_id: user_id, question_id: question_id, answer_id: answer_id, remember_token: remember_token), :method => :post, class:"btn btn-small btn-primary"
  	end
end
