class Player < ApplicationRecord
  enum :status, {
    active: 0,
    on_loan: 1,
    injured: 2,
  }
end
