class RegistrationsController < Devise::RegistrationsController
  after_filter :check_invitation

  protected
  def check_invitation
    key = session[:invite_key]
    if resource.persisted? and not key.nil?
      Membership.where(invite_key: key).update_all(member_id: resource.id)
      session.delete(:invite_key)
    end
  end
end