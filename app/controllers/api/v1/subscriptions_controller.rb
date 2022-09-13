class Api::V1::SubscriptionsController < ApplicationController
    def create
        subscription = Subscription.new(subscription_params)
        if subscription.save
            render json: SubscriptionSerializer.new(subscription).serializable_hash, status: 201
        else
            render json: {error: subscription.errors.full_messages.to_sentence}, status: 400
        end
    end

    private
    def subscription_params
        params.permit(:tea_id, :customer_id, :title, :price, :frequency, :status)
    end
end