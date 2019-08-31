class Book < ApplicationRecord
    # 空白禁止
    validates :title, presence: true
    validates :body, presence: true


end


