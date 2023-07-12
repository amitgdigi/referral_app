class Timeline < ApplicationRecord
  belongs_to :prev_user, class_name: 'User', foreign_key: :prev_user_id
  belongs_to :child_user, class_name: 'User', foreign_key: :child_user_id
end
