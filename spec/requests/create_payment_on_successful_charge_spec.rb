require 'spec_helper'

describe "Create payment on successful charge" do
  let(:event_data) do
    {
      "id"=> "evt_10317d2kFw66U1osVzzK16Jn",
      "created"=> 1385547488,
      "livemode"=> false,
      "type"=> "charge.succeeded",
      "data"=> {
        "object"=> {
          "id"=> "ch_10317d2kFw66U1osG0nm59JF",
          "object"=> "charge",
          "created"=> 1385547488,
          "livemode"=> false,
          "paid"=> true,
          "amount"=> 99,
          "currency"=> "usd",
          "refunded"=> false,
          "card"=> {
            "id"=> "card_10317d2kFw66U1os8YLvpUuT",
            "object"=> "card",
            "last4"=> "4242",
            "type"=> "Visa",
            "exp_month"=> 11,
            "exp_year"=> 2015,
            "fingerprint"=> "pGFS8GjeaKqyMHqj",
            "customer"=> "cus_317d8FwcVVahqJ",
            "country"=> "US",
            "name"=> nil,
            "address_line1"=> nil,
            "address_line2"=> nil,
            "address_city"=> nil,
            "address_state"=> nil,
            "address_zip"=> nil,
            "address_country"=> nil,
            "cvc_check"=> "pass",
            "address_line1_check"=> nil,
            "address_zip_check"=> nil
          },
          "captured"=> true,
          "refunds"=> [],
          "balance_transaction"=> "txn_10317d2kFw66U1osAUKCUcz8",
          "failure_message"=> nil,
          "failure_code"=> nil,
          "amount_refunded"=> 0,
          "customer"=> "cus_317d8FwcVVahqJ",
          "invoice"=> "in_10317d2kFw66U1osEmOW0kmx",
          "description"=> nil,
          "dispute"=> nil,
          "metadata"=> {}
        }
      },
      "object"=> "event",
      "pending_webhooks"=> 1,
      "request"=> "iar_317d83XPVEFRPl"
    }
  end

  it "creates payment with the webhook from stripe for charge succeeded", :vcr do
    post "/stripe_events", event_data
    expect(Payment.count).to eq(1)
  end

  it "creates the payment associated with user", :vcr do
    alice = Fabricate(:user, customer_token: "cus_317d8FwcVVahqJ")
    post "/stripe_events", event_data
    expect(Payment.first.user).to eq(alice)
  end


  it "creates the payment with the amount", :vcr do
    alice = Fabricate(:user, customer_token: "cus_317d8FwcVVahqJ")
    post "/stripe_events", event_data
    expect(Payment.first.amount).to eq(99)
  end

  it "creates the payment with reference id", :vcr do
    alice = Fabricate(:user, customer_token: "cus_317d8FwcVVahqJ")
    post "/stripe_events", event_data
    expect(Payment.first.reference_id).to eq("ch_10317d2kFw66U1osG0nm59JF")
  end
end
