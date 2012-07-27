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

	def create
		@option = Option.new(params[:option])
		if @option.save
			flash[:success] = "New option created"
			redirect_to options_path
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
