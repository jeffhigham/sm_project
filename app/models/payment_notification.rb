class PaymentNotification < ActiveRecord::Base
  attr_accessible :params, :status, :transaction_id, :work_order_id
  belongs_to :work_order
  serialize :params
  after_create :mark_cart_as_purchased
  
  private
	  def mark_cart_as_purchased
	    if status == "Completed"
	      work_order.update_attributes(:paid => Time.now)
	    end
	  end

end
