class RoqsController < ApplicationController
	before_filter :signed_in_user	
	before_filter :admin_user

	def new
		@roq = Roq.new(question_id: @question.id, option_id: nil)
	end

	def add
	end

	def edit
		@roq = Roq.find(params[:id])
		@options = Option.all
		@questions = Question.all
	end

	def update
		@roq = Roq.find(params[:id])
		if @roq.update_attributes(params[:roq])
			flash[:success] = "Option updated successfully"
			redirect_to question_path(@roq.question_id)
		else
			flash[:failure] = "Option not updated"
			redirect_to question_path(@roq.question_id)
		end
	end

	def create
		@roq = Roq.new(question_id: params[:question_id], option_id: params[:option_id])
		if @roq.save
			flash[:success] = "Successfully added an option to the question"
			redirect_to add_question_path(@roq.question_id)
		else
			redirect_to add_question_path(@roq.question_id)
		end
	end

	def destroy
			@roq = Roq.find(params[:id])
			@question = @roq.question_id
			@roq.destroy
			redirect_to question_path(@question)
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
