class CalorieIntake < ApplicationRecord
    belongs_to :user

    # ユーザーIDに紐付いたデータを取得
    def self.by_user_id(user_id)
        where(user_id: user_id)
    end
end
