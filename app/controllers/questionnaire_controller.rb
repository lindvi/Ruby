class QuestionnaireController < ApplicationController

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new(user_id: current_user.id, question_id: @question.id, remember_token: current_user.remember_token)
	end

end
