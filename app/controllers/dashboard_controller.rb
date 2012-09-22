# coding: utf-8
class DashboardController < ApplicationController
  def index
    @recent_actions = []
    @recent_actions << Activity.visit.where(:date.lte => Time.now).limit(10).desc(:date)
    @recent_actions << Activity.mail.where(:date.lte => Time.now).limit(10).desc(:date)
    @recent_actions << Activity.DM.where(:date.lte => Time.now).limit(10).desc(:date)
    @recent_actions << Activity.call.where(:date.lte => Time.now).limit(10).desc(:date)
    @recent_actions << Activity.guest.where(:date.lte => Time.now).limit(10).desc(:date)
    @next_actions =
      Activity.where(:date.gte => Time.now).where(:date.lt => 1.week.from_now).asc(:date)
    @tasks = Task.unclosed.asc(:deadline)
    @results = Hash.new 
    @results[:earnings] = Campaign.where(:closed_at.gte => Time.zone.parse("2012-08-01")).has_committed.map(&:amount).map(&:to_i).sum
    @results[:performance] = Campaign.where(:closed_at.gte => Time.zone.parse("2012-08-01")).has_committed.count
    @results[:percentile1] = @results[:earnings]*100/105000000
    @results[:percentile2] = @results[:performance]*100/17
    @total = Campaign.not_bti
    @pending_count = Campaign.pendings.count
    @keep_in_touch = Campaign.not_bti.not_closed.where(:recent_act_at.lte => 3.months.ago).asc(:date)
    @test = nil
      
    respond_to do |format|
      format.html
      format.json { render json: @next_actions }
    end 
  end
  
  def search
    word = params[:search]
    if word
      @campaigns = Campaign.search(word)
      @customers = Customer.search(word)
    end
    
    respond_to do |format|
      format.html { render '/dashboard/result' }
      format.json { render json: @next_actions }
    end 
  end

  def orders_for_each_month
    base_date = Time.zone.parse("2012-08-01")
    width = params[:width].to_i / 2 - 50
    now = Time.now
    months = Array.new
    planned = Array.new
    amount = 0
    planned_amount = 0
    12.times do
      if base_date < now
        amount += Campaign.has_committed.where(closed_at: base_date.all_month).inject(0){|r,v| v.amount.to_i/1000000 + r}
        planned_amount += amount
        months << amount
      else
        months << nil
      end
      planned_amount += Campaign.not_closed.where(period: base_date.all_month).inject(0){|r,v| v.amount.to_i/1000000 + r}
      planned << planned_amount
      base_date = base_date.next_month
    end
    data1 = ["受注金額"] + months
    data2 = ["売上予想"] + planned
    resp = {
      "config" => {
        "title" => "売上げ推移",
        "titleColor" => "#888888",
        "titleFont" => "100 28px 'Arial Black'",
        "unit" => "百万円",
        "unitAlign" => "left",
        "type" => "line",
        "axisXLen" => 15,
        "bg" => "#ffffff",
        "lineWidth" => 5,
        "width" => "#{width}",
        "height" => "400",
        "hanreiColor" => "#222222",
        "maxY" => "150",
        "minY" => "0",
        "colorSet" =>
          ["rgba(204,0,0,0.5)","rgba(51,102,255,0.5)"]
      },
      "data" => [
        ["月","8月","9月","10月","11月","12月","1月","2月","3月","4月","5月","6月","7月"],
        data2, data1
      ]
    }
    puts resp.to_json
    render :json => resp
  end

  def acts_for_each_month
    base_date = 26.weeks.ago
    width = params[:width].to_i - 20
    now = Time.now
    acts_v = Array.new
    acts_m = Array.new
    acts_D = Array.new
    acts_c = Array.new
    acts_g = Array.new
    x = ['週']
    26.times do
      acts_v << Activity.visit.where(date: base_date.all_week).count
      acts_m << Activity.mail.where(date: base_date.all_week).count
      acts_D << Activity.DM.where(date: base_date.all_week).count
      acts_c << Activity.call.where(date: base_date.all_week).count
      acts_g << Activity.guest.where(date: base_date.all_week).count
      x << base_date.beginning_of_week.strftime('%m-%d')
      base_date = base_date.next_week
    end
    data1 = ["訪問"] + acts_v
    data2 = ["メール"] + acts_m
    data3 = ["ＤＭ"] + acts_D
    data4 = ["電話"] + acts_c
    data5 = ["来客"] + acts_g
    resp = {
      "config" => {
        "title" => "過去半年の活動状況",
        "titleColor" => "#888888",
        "titleFont" => "100 28px 'Arial Black'",
        "unit" => "活動件数",
        "unitAlign" => "left",
        "subTitleColor" => "#808080",
        "type" => "stacked",
        "axisXLen" => 15,
        "bg" => "#ffffff",
        "width" => "#{width}",
        "height" => "300",
        "hanreiColor" => "#222222",
        "maxY" => "15",
        "minY" => "0",
        "colorSet" =>
          ["rgba(238,184,89,0.5)","rgba(186,85,211,0.5)","rgba(60,179,113,0.5)","rgba(250,128,114,0.5)","rgba(128,128,0,0.5)"]
      },
      "data" => [x,data1,data2,data3,data4,data5]
    }
    puts resp.to_json
    render :json => resp
  end
end
