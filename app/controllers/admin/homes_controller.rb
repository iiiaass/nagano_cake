class Admin::HomesController < ApplicationController
  def top
    @order=Admin.all
  end
end
