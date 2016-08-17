class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_enrolled_in_course?

  def show
  end

  private

  def current_user_enrolled_in_course?
    if current_user.enrolled_in?(current_lesson.section.course) == false
      redirect_to course_path(current_lesson.section.course), :alert => 'You must enroll to view the lesson'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
