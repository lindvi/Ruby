class QuestionsController < ApplicationController
	before_filter :signed_in_user
	before_filter :admin_user
	
	def index
		@questions = Question.all
	end
	def show
		@question = Question.find(params[:id])
		@roqs = Roq.where("question_id = ?", params[:id])
	end

	def new
		@question = Question.new
	end

	def add
		@question = Question.find(params[:id])
		@options = Option.all
		@roqs = Roq.where("question_id = ?", params[:id])
		@roq = Roq.new(question_id: params[:id], option_id: nil)
	end

	def done
		@roq = Roq.new(params[:roq])
		if @roq.save
			flash[:success] = "Successfully added a option to the question"
			redirect_to add_question_path
		else
			redirect_to add_question_path
		end
	end


	def create
		@question = Question.new(params[:question])
		if @question.save
			flash[:success] = "New question added"
			redirect_to questions_path
		else
			render 'new'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_path
	end

	private

	def signed_in_user
	  unless signed_in?
	    store_location
	    redirect_to signin_path, notice: "Please sign in."
	  end
	end

	def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
