class RecordsController < ApplicationController
  def create
    must_sign_in
    render_resource Record.create create_params
  end

  private

  def create_params
    params.permit(:amount, :category, :notes)
  end
end
