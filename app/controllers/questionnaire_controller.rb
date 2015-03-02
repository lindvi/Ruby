class QuestionnaireController < ApplicationController
	before_filter :signed_in_user, :unless => :registration
	
	def show
		@question = Question.find(params[:id])
	end
	
	

	private
	
	def signed_in_user
	  unless signed_in?
	    store_location
	    redirect_to signin_path, notice: "Please sign in."
	  end
	end

	def registration
		#!Rpq.find_by_project_id_and_question_id(Project.find_by_name("Registrering").id, params[:id]).nil?
		@inner = Project.where("name = ?", "Registrering").first.id
		return !Rpq.where("id = ? AND question_id = ?", @inner, params[:question_id]).nil?

	end
end
