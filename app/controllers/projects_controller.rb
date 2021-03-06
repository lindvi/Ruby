class ProjectsController < ApplicationController
	#before_filter :signed_in_user
	#before_filter :admin_user
	before_filter :signed_in_user, except: [:show], :unless => :has_auth
	before_filter :admin_user, except: [:show], :unless => :has_auth
	before_filter :has_auth, only: [:show]
	after_filter :set_access_control_headers

	def index
		@projects = Project.all
		@questions = Question.all

		respond_to do |format|
	    	format.html # show.html.erb
	    	format.json # show.json.json_builder
	    end
	end

	def edit
		@project = Project.find(params[:id])
	end


	def show
		#@project = Project.find(params[:id])
		if params[:id].to_i == 0
			@project = Project.where("name = ?", (params[:id]))
		else
			@project = Project.find(params[:id])
		end
		@rpqs = Rpq.where("project_id = ?", params[:id])
		
		respond_to do |format|
	    	format.html # show.html.erb
	    	format.xml # show.xml.xml_builder
	    	format.json # show.json.json_builder
	    end
	end

	def update
		@project = Project.find(params[:id])
		@project.start_question_name = Question.find(params[:project][:start_question]).name
		if @project.update_attributes(params[:project])
			flash[:success] = "Project updated successfully"
			redirect_to project_path
		else
			flash[:failure] = "Project not updated"
			redirect_to project_path
		end
	end

	def new
		@project = Project.new
	end

	def add
		@project = Project.find(params[:id])
		@questions = Question.all
		@rpqs = Rpq.where("project_id = ?", params[:id])
		@rpq = Rpq.new(project_id: params[:id], question_id: nil)
	end

	def done
		@rpq = Rpq.new(params[:rpq])
		if @rpq.save
			flash[:success] = "Successfully added a question to the project"
			redirect_to add_project_path
		else
			redirect_to add_project_path
		end
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			flash[:success] = "New project created!"	
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	def enable
		@project = Project.find(params[:id])
		if @project.update_attributes(active: true)
			flash[:success] = "The project is now active"
			redirect_to @project
		else
			redirect_to @project
		end
	end

	private

		def has_auth
			if params[:key] != nil && params[:key] == "LPDDKMICRKDMKFTU"
				return true
			else
				return false				
			end
		end

		def signed_in_user
		  unless signed_in?
		    store_location
		    redirect_to signin_path, notice: "Please sign in."
		  end
		end
	
		def admin_user
      		redirect_to(root_path) unless current_user.admin?
	    end

	    def set_access_control_headers
		    headers['Access-Control-Allow-Origin'] = "*"
		    headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
		end
end
