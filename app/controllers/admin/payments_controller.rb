class Admin::PaymentsController < AdminsController
  def index
    @payments = Payment.all #never do this for production apps
  end
end
