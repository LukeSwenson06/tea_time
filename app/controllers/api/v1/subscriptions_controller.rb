class Api::V1::SubscriptionsController < ApplicationController
    def create
        subscription = Subscription.create(subscription_params)
        render json: SubscriptionSerializer.new(subscription).serializable_hash, status: 201
    end

    private
    def subscription_params
        params.permit(:tea_id, :customer_id, :title, :price, :frequency, :status)
    end
end