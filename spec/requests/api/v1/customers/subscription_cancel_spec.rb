equire 'rails_helper'

describe 'subscription endpoint' do
    it 'subscribes a customer to a tea subscription' do    
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")
        subcription = Subscription.create(title: "monthly masterpiece collection", price: 127.0, frequency: :yearly, tea_id: oolong_tea.id, customer_id: customer.id)
    
        expect(subscription.status).to eq("active")
        
        patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: {status: "cancelled"}

        expect(response.status).to eq(204)
        expect(subscription.status).to eq("cancelled")
    end
end