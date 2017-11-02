class DosesController < ApplicationController
  def create
  end

  def new
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

end
