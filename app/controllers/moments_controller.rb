class MomentsController < ApplicationController
  before_action :set_moment, only: %i[ show edit update destroy ]

  def index
    @moments = Moment.all
  end

  def show
  end

  def new
    @moment = Moment.new
  end

  def edit
  end

  def create
    @moment = Moment.new(moment_params)

    respond_to do |format|
      if @moment.save
        format.html { redirect_to moment_url(@moment), notice: "Moment was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @moment.update(moment_params)
        format.html { redirect_to moment_url(@moment), notice: "Moment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @moment.destroy

    respond_to do |format|
      format.html { redirect_to moments_url, notice: "Moment was successfully destroyed." }
    end
  end

  private
    def set_moment
      @moment = Moment.find(params[:id])
    end

    def moment_params
      params.require(:moment).permit(:name)
    end
end
