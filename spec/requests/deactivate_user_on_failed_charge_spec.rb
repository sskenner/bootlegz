require 'spec_helper'

describe "Deactivate user on failed charge" do
  let(:event_data) do
    {
      "id"=> "evt_1031kq2kFw66U1osPggjcP1D",
      "created"=> 1385693357,
      "livemode"=> false,
      "type"=> "charge.failed",
      "data"=> {
        "object"=> {
          "id"=> "ch_1031kq2kFw66U1osGf7mojwV",
          "object"=> "charge",
          "created"=> 1385693357,
          "livemode"=> false,
          "paid"=> false,
          "amount"=> 99,
          "currency"=> "usd",
          "refunded"=> false,
          "card"=> {
            "id"=> "card_1031kp2kFw66U1osQfvTqKgA",
            "object"=> "card",
            "last4"=> "0341",
            "type"=> "Visa",
            "exp_month"=> 11,
            "exp_year"=> 2016,
            "fingerprint"=> "1KdE169fWjz3GIyJ",
            "customer"=> "cus_31Vt54EXXOTrY1",
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
          "captured"=> false,
          "refunds"=> [],
          "balance_transaction"=> nil,
          "failure_message"=> "Your card was declined.",
          "failure_code"=> "card_declined",
          "amount_refunded"=> 0,
          "customer"=> "cus_31Vt54EXXOTrY1",
          "invoice"=> nil,
          "description"=> "payment to fail",
          "dispute"=> nil,
          "metadata"=> {}
        }
      },
      "object"=> "event",
      "pending_webhooks"=> 1,
      "request"=> "iar_31kqJYwn4trsaJ"
    }
  end

  it "deactivates a user with the web hook data from stripe for charge failed", :vcr do
    alice = Fabricate(:user, customer_token: "cus_31Vt54EXXOTrY1")
    post "/stripe_events", event_data
    expect(alice.reload).not_to be_active
  end
end
