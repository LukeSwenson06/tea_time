class Api::V1::SubscriptionsController < ApplicationController
    def index
        customer = Customer.find(params[:customer_id])
        render json: SubscriptionSerializer.new(customer.subscriptions).serializable_hash, status: 200
    end
    def create
        subscription = Subscription.new(subscription_params)
        if subscription.save
            render json: SubscriptionSerializer.new(subscription).serializable_hash, status: 201
        else
            render json: {error: subscription.errors.full_messages.to_sentence}, status: 400
        end
    end

    def update
        subscription = Subscription.find_by(customer_id: params[:customer_id], id: params[:id])
        if subscription
            subscription.update(subscription_params)
            render json: SubscriptionSerializer.new(subscription).serializable_hash, status: 200
        else
            render json: {error: "No subscription is found"}, status: 400
        end
    end

    private
    def subscription_params
        params.permit(:tea_id, :customer_id, :title, :price, :frequency, :status)
    end
end