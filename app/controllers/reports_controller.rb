class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_report, only: [:show, :edit, :close]

  def show
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.closed = false
    @report.reporter = current_user
    if @report.save
      redirect_to report_path(@report)
    else
      render :edit
    end
  end

  def edit
  end

  def index
    @reports = Report.all
    case params[:sort]
    when "all"
      @reports = @reports
    when "open"
      @reports = @reports.where(:closed => false)
    when "closed"
      @reports = @reports.where(:open => false)
    else
      @reports = @reports.where(:closed => false)
    end
  end

  def close
    @report.closed = true
    @report.save
    redirect_to report_path(@report), :notice => "Successfully closed a ticket."
  end

  def open
    @report.closed = false
    @report.save
    redirect_to report_path(@report), :notice => "Successfully reopened a ticket."  
  end

  private
  def set_report
    @report = Report.find(params[:id] || params[:report_id])
  end

  def report_params
    params.require(:report).permit(:reason, :reporter_id, :evidence, :closed)
  end
end
