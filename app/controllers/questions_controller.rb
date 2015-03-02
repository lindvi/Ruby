class QuestionsController < ApplicationController
	before_filter :signed_in_user
	before_filter :admin_user
	
	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
		@roqs = Roq.where("question_id = ?", params[:id]).order("value")
	end

	def new
		@question = Question.new
	end

	def edit
		@question = Question.find(params[:id])
	end

	def add
		@question = Question.find(params[:id])
		@options = Option.all
		@roqs = Roq.where("question_id = ?", params[:id])
		@roq = Roq.new
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

	def update
		@question = Question.find(params[:id])
		if @question.update_attributes(params[:question])
			if @question.name.start_with?"NS_"
				@reversed_question = Question.where("name = ?", @question.name[3..@question.name.length-1])
			else
				@reversed_question = Question.where("name = ?", "NS_" + @question.name)
			end

			if !@reversed_question.empty?
				@reversed_question.content = @question.content
				@reversed_question.save
			end

			flash[:success] = "Question and related question updated successfully"
			redirect_to question_path
		else
			flash[:failure] = "Failed to update question"
			redirect_to question_path
		end
	end

	def create
		@question = Question.new(params[:question])
		if @question.save
			@rpq = Rpq.new
			@rpq.question_id = @question.id
			@rpq.project_id = params[:pid]
			@rpq.save
			flash[:success] = "New question added"
			redirect_to project_path(params[:pid])
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
