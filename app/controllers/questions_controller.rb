# Questions Controller Class
class QuestionsController < ApplicationController
  def ask
    # ask action
  end

  def answer
    @question = params[:question].strip
    @answer = "I don't care, get dressed and go to work!"
    if @question == 'I am going to work'
      @answer = 'Great!'
    elsif @question.last == '?'
      @answer = 'Silly question, get dressed and go to work!'
    end
  end
end
