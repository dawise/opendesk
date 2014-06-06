class InvitationsController < ApplicationController

  skip_before_action :authenticate_user!, only: :join

  def create
    emails = params[:emails].gsub(' ', '').split(',')
    project = Project.find(params[:project_id])

    InvitationMailer.invite_members(emails, project)

    flash[:notice] = 'Invitation(s) sent!'
    redirect_to project
  end

  def join
    # Simply get the invitation key form the URL, save it into the session and
    # redirect back to user sign up form
    session[:invite_key] = params[:invite_key]

    flash[:notice] = 'Welcome! Please create your account to access the project'
    redirect_to new_user_registration_path
  end

end
