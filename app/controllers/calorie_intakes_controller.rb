class CalorieIntakesController < ApplicationController
  before_action :set_calorie_intake, only: %i[ show edit update destroy ]

  # GET /calorie_intakes or /calorie_intakes.json
  def index
    respond_to do |format|
      if user_signed_in?
        format.html { @calorie = CalorieIntake.select("date, sum(amount) as amount").where(user_id: current_user.id).group("date") 
                      @calorie_intakes = CalorieIntake.new }
        format.json { @calories = CalorieIntake.where(user_id: current_user.id, date: "%#{params[:selected_day]}%") }
      else
        format.html { @calorie = CalorieIntake.none }
        format.json {  }
      end
    end
  end

  # GET /calorie_intakes/1 or /calorie_intakes/1.json
  def show
  end

  # GET /calorie_intakes/new
  def new
    @calorie_intake = CalorieIntake.new
  end

  # GET /calorie_intakes/1/edit
  def edit
  end

  # POST /calorie_intakes or /calorie_intakes.json
  def create
    @calorie_intake = CalorieIntake.new(calorie_intake_params)

    respond_to do |format|
      if @calorie_intake.save
        format.html { redirect_to calorie_intakes_url, notice: "登録しました" }
        format.json { render :show, status: :created, location: @calorie_intake }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calorie_intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calorie_intakes/1 or /calorie_intakes/1.json
  def update
    respond_to do |format|
      if @calorie_intake.update(calorie_intake_params)
        format.html { redirect_to calorie_intakes_url, notice: "更新しました" }
        format.json { render :show, status: :ok, location: @calorie_intake }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calorie_intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calorie_intakes/1 or /calorie_intakes/1.json
  def destroy
    @calorie_intake.destroy
    respond_to do |format|
      format.html { redirect_to calorie_intakes_url, notice: "削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calorie_intake
      @calorie_intake = CalorieIntake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calorie_intake_params
      params.require(:calorie_intake).permit(:name, :date, :amount).merge(user_id: current_user.id)
    end
end
