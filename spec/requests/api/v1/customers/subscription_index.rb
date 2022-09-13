require 'rails_helper'

describe 'customer endpoint' do
    it 'sees all customers tea subscriptions active and cancelled' do    
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")
        green_tea = Tea.create(title: "Green Tea", description: "Its green!! What else is there to say about it?!", brew_time: "1 minutes")
        subscription = Subscription.create(title: "monthly masterpiece collection", price: 127.0, frequency: :yearly, tea_id: oolong_tea.id, customer_id: customer.id)
        subscription_2 = Subscription.create(title: "green goo subscription special", price: 10.0, frequency: :yearly, tea_id: green_tea.id, customer_id: customer.id, status: :cancelled)

        get "/api/v1/customers/#{customer.id}/subscriptions"
        
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data].count).to eq(2)
     
        active_sub = json[:data][0][:attributes]
        expect(active_sub[:title]).to eq("monthly masterpiece collection")
        expect(active_sub[:price]).to eq(127.0)
        expect(active_sub[:frequency]).to eq("yearly")
        expect(active_sub[:status]).to eq("active")
      
        cancelled_sub = json[:data][1][:attributes]
        expect(cancelled_sub[:title]).to eq("green goo subscription special")
        expect(cancelled_sub[:price]).to eq(10.0)
        expect(cancelled_sub[:frequency]).to eq("yearly")
        expect(cancelled_sub[:status]).to eq("cancelled")
    end
end