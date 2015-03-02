class OptionsController < ApplicationController
	before_filter :signed_in_user
	before_filter :admin_user
	
	def index
		@options = Option.all
	end

	def show
		@option = Option.find(params[:id])
	end

	def new
		@option = Option.new
	end

	def edit
		@option = Option.find(params[:id])
	end 

	def update
		@option = Option.find(params[:id])
		if @option.update_attributes(params[:option])
			flash[:success] = "Option updated Successfully"
		else
			flash[:failure] = "Failed to update option"
		end
			@g = Roq.where("option_id = ?", @option.id)
			@q = Question.find(@g.question_id)

			redirect_to @q
	end

	def create
		@option = Option.new(params[:option])
		if @option.save
			@roq = Roq.new
			@roq.option_id = @option.id
			@roq.question_id  = params[:qid]
			@roq.save
			flash[:success] = "Option added"
			redirect_to question_path(params[:qid])
		else
			render 'new'
		end
	end

	def destroy
		@option = Option.find(params[:id])
		@option.destroy
		redirect_to options_path
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
