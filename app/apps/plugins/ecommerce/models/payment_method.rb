=begin
  Camaleon CMS is a content management system
  Copyright (C) 2015 by Owen Peredo Diaz
  Email: owenperedo@gmail.com
  This program is free software: you can redistribute it and/or modify   it under the terms of the GNU Affero General Public License as  published by the Free Software Foundation, either version 3 of the  License, or (at your option) any later version.
  This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the  GNU Affero General Public License (GPLv3) for more details.
=end
class Plugins::Ecommerce::Models::PaymentMethod < TermTaxonomy
  default_scope { where(taxonomy: :ecommerce_payment_method) }
  belongs_to :site, :class_name => "Site", foreign_key: :parent_id

  scope :actives, -> {where(status: '1')}

  def method_text
    if options[:type] == 'paypal'
      I18n.t 'plugin.ecommerce.method_paypal'
    elsif options[:type] == 'credit_card'
      I18n.t 'plugin.ecommerce.method_credit_card'
    elsif options[:type] == 'bank_transfer'
      I18n.t 'plugin.ecommerce.method_bank_transfer'
    else
      'None'
    end
  end

end