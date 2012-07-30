class AnswersController < ApplicationController
	before_filter :signed_in_user

	def new
	end

	def create
		@answer = Answer.new(params[:answer])
		redirect_to questionnaire_path(@answer.answer_id)
	end

	private

	def signed_in_user
	  unless signed_in?
	    store_location
	    redirect_to signin_path, notice: "Please sign in."
	  end
	end

end
