class CouponsController < ApplicationController
  def show
    @coupon = Coupon.find(params[:id])
  end

  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    coupon = Coupon.find(params[:id])
    coupon.update(coupon_params)

    redirect_to coupon
  end

  def create
    @coupon = Coupon.new
    @coupon[:coupon_code] = params[:coupon][:coupon_code]
    @coupon[:store] = params[:coupon][:store]
    @coupon.save
    redirect_to coupon_path(@coupon)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:coupon_code, :store)
  end
end
