class InvitationMailer < ActionMailer::Base
  default from: "hello@deskus.co"

  def self.invite_members(emails, project)
    emails.each do |email|
      member = User.find_by(email: email)
      if member.present?
        Membership.find_or_initialize_by(member: member, project: project)
        added_to_project_email(project, email).deliver
      else
        # Create or find a membership for this project with the hash of the email
        # as the invitation key so that all invitations for a given email are found
        # with the same invitation key
        key = Digest::MD5.hexdigest(email*2)
        m = Membership.find_or_initialize_by(project: project, invite_key: key)

        if m.new_record?
          invitation_email(project, email, key).deliver
          m.save
        elsif m.member.nil?
          reinvite_email(project, email, key).deliver
        end
      end
    end
  end

  def invitation_email(project, email, invitation_key)
    @project = project
    @key = invitation_key
    mail(to: email, subject: 'Invitation from Deskus!')
  end

  def reinvite_email(project, email, invitation_key)
    @project = project
    @key = invitation_key
    mail(to: email, subject: 'They\'re waiting for you on Deskus!')
  end

  def added_to_project_email(project, email)
    @project = project
    mail(to: email, subject: "You're the latest member of #{project.name} on Deskus!")
  end
end
