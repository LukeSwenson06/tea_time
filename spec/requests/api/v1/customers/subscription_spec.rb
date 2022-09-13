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

        expect(subscription[:data]).to have_key :id
        attributes = subscription[:data][:attributes]
        expect(attributes).to have_key :title
        expect(attributes[:title]).to be_a String
        expect(attributes).to have_key :price
        expect(attributes[:price]).to be_a Float
        expect(attributes).to have_key :frequency
        expect(attributes[:frequency]).to be_a String
        expect(attributes).to have_key :status
        expect(attributes[:status]).to be_a String
    end

    it 'throws an error when request is missing a title' do
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")
        
        params = {
           
                tea_id: oolong_tea.id,
                price: "127",
                frequency: :yearly
    }

        post "/api/v1/customers/#{customer.id}/subscriptions", params: params
    
        expect(response.status).to eq(400)
        
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:error]).to eq("Title can't be blank")
    end
    
    it 'throws an error when request is missing a price' do
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")
        
        params = {
           
                tea_id: oolong_tea.id,
                title: "monthly masterpiece collection", 
                frequency: :yearly
    }

        post "/api/v1/customers/#{customer.id}/subscriptions", params: params
    
        expect(response.status).to eq(400)
        
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:error]).to eq("Price can't be blank")
    end

    it 'throws an error when request is missing a frequency' do
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")
        
        params = {
           
                tea_id: oolong_tea.id,
                title: "monthly masterpiece collection", 
                price: "127"
    }

        post "/api/v1/customers/#{customer.id}/subscriptions", params: params
    
        expect(response.status).to eq(400)
        
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:error]).to eq("Frequency can't be blank")
    end

    it 'throws an error when request is missing a frequency' do
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")
        
        params = {
           
                tea_id: oolong_tea.id,
                title: "monthly masterpiece collection", 
                price: "127"
    }

        post "/api/v1/customers/#{customer.id}/subscriptions", params: params
    
        expect(response.status).to eq(400)
        
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:error]).to eq("Frequency can't be blank")
    end

    it 'throws an error when request is missing a frequency' do
        customer = Customer.create(first_name: "Luke", last_name: "Swenson", email: "thebestemail@email.com", address: "nowhere road")
        oolong_tea = Tea.create(title: "Oolong Tea", description: "Partially oxidized tea between black and green tea", brew_time: "2 minutes")
        
        params = {
           
                title: "monthly masterpiece collection", 
                price: "127",
                frequency: :yearly
    }

        post "/api/v1/customers/#{customer.id}/subscriptions", params: params
    
        expect(response.status).to eq(400)
        
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:error]).to eq("Tea must exist")
    end
end