class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :new_comment]
  before_action :fetch_questions, except: [:index ]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.order(updated_at: :desc).eager_load(:answers, :user)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to new_question_path, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        @questions.reload
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to new_question_path, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_comment
    @comment = @question.answers.new
  end


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id] || params[:question_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:id, :question_name)
  end

  def fetch_questions
    @questions = current_user.questions.order(updated_at: :desc)
  end
end
