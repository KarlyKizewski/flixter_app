class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_enrollment, only: [:show]

  def show
  end

  private

  def require_authorized_for_enrollment
    unless current_user.enrolled_in?(current_lesson.section.course)
      redirect_to courses_path, alert: 'You must be enrolled to view lesson.'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id]) 
  end
end
