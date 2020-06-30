class MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
    redirect_to member_path(@member)
    else
      render "edit"
    end
  end

  private
  def member_params
    params.require(:member).permit(:email, :name, :image, :profile)
  end
end