class AnswersController < ApplicationController
	#before_filter :signed_in_user, :unless => :registration

	def new
	end

	def create
		if params[:answer].nil?
			@answer = Answer.new(user_id: params[:user_id],question_id: params[:question_id], answer_id: params[:answer_id], remember_token: params[:remember_token])
		else
			@answer = Answer.new(params[:answer])
		end
		if @answer.save
			flash[:success] = "Answer saved"
			redirect_to questionnaire_path(@answer.answer_id)
		else
			flash[:failure] = "Failed to save answer"
			redirect_to questionnaire_path(params[:question_id])
		end
	end

	private

	def registration
		#!Rpq.find_by_project_id_and_question_id(Project.find_by_name("Registrering").id, params[:question_id]).nil?
		@inner = Project.where("name = ?", "Registrering").first.id
		return !Rpq.where("id = ? AND question_id = ?", @inner, params[:question_id]).nil?
	end

	def signed_in_user
	  unless signed_in?
	    store_location
	    redirect_to signin_path, notice: "Please sign in."
	  end
	end

end
