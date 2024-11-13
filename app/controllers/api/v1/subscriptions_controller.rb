class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(Subscription.all)
  end

  def show
    subscription = Subscription.includes(:customer, :tea).find(params[:id])
    render json: SubscriptionSerializer.new(subscription).serializable_hash
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Subscription not found" }, status: :not_found
  end

  def update
    @subscription = Subscription.find_by(id: params[:id])
    if @subscription.update(subscription_params)
      render json: SubscriptionSerializer.new(@subscription)
    else
      error_response = {
        message: "Could not make changes to your subscription at this time",
        errors: @subscription.errors.full_messages
      }
      render json: error_response, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :activestatus, :frequency)
  end

end
