class RpqsController < ApplicationController
	before_filter :signed_in_user
	before_filter :admin_user

	def new
		@rpq = Rpq.new(project_id: @project.id, question_id: nil)
	end

	def add
	end

	def create
		@rpq = Rpq.new(project_id: params[:project_id], question_id: params[:question_id])
		if @rpq.save
			flash[:success] = "Successfully added a question to the project"
			redirect_to add_project_path(@rpq.project_id)
		else
			redirect_to add_project_path(@rpq.project_id)
		end
	end

	def destroy
		@rpq = Rpq.find(params[:id])
		@project = @rpq.project_id
		@rpq.destroy
		redirect_to project_path(@project)
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
