# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = Ticket.all

    if params[:project] != '' && params[:project]
      @tickets = @tickets.filter_by_project(params[:project])
    end

    if params[:status] != '' && params[:status]
      @tickets = @tickets.filter_by_status(params[:status])
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
    @ticket.user = current_user

    if params[:project] && Project.find_by(id: params[:project])
      @ticket.project_id = params[:project]
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end


  def update
    #to-do
  end

  def destroy
    #to-do
  end

  private

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
