# == Schema Information
#
# Table name: omni_auth_services
#
#  id                  :bigint           not null, primary key
#  access_token        :string
#  access_token_secret :string
#  auth                :text
#  expires_at          :datetime
#  provider            :string
#  refresh_token       :string
#  uid                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_omni_auth_services_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe OmniAuthService, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
