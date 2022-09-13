require 'rails_helper'

describe 'subscription endpoint' do
    it 'subscribes a customer to a tea subscription' do    
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")

    params = {
        tea_id: oolong_tea.id,
        title: "monthly masterpiece collection",
        price: "127",
        frequency: :yearly
    }
    post "/api/v1/customers/#{customer.id}/subscriptions", params: params
    expect(response.status).to eq(201)

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(subscription).to have_key :tea_id
    expect(subscription[:data]).to have_key :title
    expect(subscription[:data][:title]).to be_a String
    expect(subscription[:data]).to have_key :price
    expect(subscription[:data][:price]).to be_a String
    expect(subscription[:data]).to have_key :frequency
    expect(subscription[:data]).to be_a Symbol
    end
end