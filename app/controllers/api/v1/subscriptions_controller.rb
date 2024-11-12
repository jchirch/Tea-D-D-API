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

end
