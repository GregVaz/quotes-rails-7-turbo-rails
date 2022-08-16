class Quote < ApplicationRecord
	has_many :line_item_dates, dependent: :destroy
  has_many :line_items, through: :line_item_dates
	belongs_to :company

	validates :name, presence: true

	scope :ordered, -> { order(id: :desc) }

	# syntactic sugar
	# the target option will be equal to model_name.plural, which is equal to "quotes" in the context of our Quote model. We can remove the target: "quotes" option
	# Under the hood, Turbo has a default value for both the partial and the locals option.
	# 	The partial default value is equal to calling to_partial_path on an instance of the model, which by default in Rails for our Quote model is equal to "quotes/quote"
	# 	The locals default value is equal to { model_name.element.to_sym => self } which, in in the context of our Quote model, is equal to { quote: self }.
	##  action -> { broadcast_replace_later_to "quotes" }
	
	# after_create_commit -> { broadcast_prepend_later_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
	# after_update_commit -> { broadcast_replace_later_to "quotes" }
	# after_destroy_commit -> { broadcast_remove_to "quotes" }
	# Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { [quote.company, "quotes"]}, inserts_by: :prepend

	def total_price
		line_items.sum(&:total_price)
	end
end
