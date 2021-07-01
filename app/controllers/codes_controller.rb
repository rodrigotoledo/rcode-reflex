class CodesController < ApplicationController
  def index
    @codes = Code.all
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    @code.user_uuid = current_user

    respond_to do |format|
      if @code.save
        # format.turbo_stream { render turbo_stream: turbo_stream.replace(@code, partial: "codes/form", locals: { code: @code }) }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@code, partial: "codes/form", locals: { code: @code }) }
      end
    end
  end

  protected
    def code_params
      params.require(:code).permit(:code, :user)
    end
end