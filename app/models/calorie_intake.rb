class CalorieIntake < ApplicationRecord
    belongs_to :user

    validates :name,   presence: true        # not null
    validates :name,   length: { in: 1..40 } # 1文字以上40文字以下
    validates :date,   presence: true        # not null
    validates :amount, presence: true        # not null
    validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 } # 0以上999999以下
    validates :amount, numericality: { only_integer: true } # 整数のみ

    # ユーザーIDに紐付いたデータを取得
    def self.by_user_id(user_id)
        where(user_id: user_id)
    end
end
