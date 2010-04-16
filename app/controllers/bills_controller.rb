class BillsController < ApplicationController

  def index
    case params[:status]
    when 'pendente'
      conditions = { :paid => false }
    when 'pago'
      conditions = { :paid => true }
    when 'atrasado'
      conditions = ['due_date < ?', Date.today]
    else
      conditions = nil
    end    
    
    if params[:category_id]
      @bills = Bill.paginate_all_by_category_id(params[:category_id], :page => params[:page], :conditions => conditions)
    else
      @bills = Bill.paginate :all, :page => params[:page], :conditions => conditions
    end
    
    @total = 0
    @bills.each do |bill|
      @total += bill.amount
    end

    @categories = Category.all
  end

  def show
    @bill = Bill.paginate(params[:id])
  end

  def new
    @bill = Bill.new
    @categories = Category.all
  end

  def edit
    @bill = Bill.find(params[:id])
    @categories = Category.all
  end

  def create
    params[:bill][:amount].gsub!(',', '.')
    @bill = Bill.new(params[:bill])
    
    if @bill.save
      flash[:notice] = 'Bill was successfully created.'
      redirect_to(@bill)
    else
      render :action => "new"
    end
  end

  def update
    params[:bill][:amount].gsub!(',', '.')
    @bill = Bill.find(params[:id])
    
    if @bill.update_attributes(params[:bill])
      flash[:notice] = 'Bill was successfully updated.'
       redirect_to(@bill)
    else
      render :action => "edit"
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to(bills_url)
  end

end
