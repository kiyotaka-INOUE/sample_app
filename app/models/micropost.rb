class Micropost < ActiveRecord::Base
    # maicropostから見てユーザーは一人しかいないので、belongs_toを使用する。（リレーションシップ設定）
    belongs_to :user
    default_scope -> { order('created_at DESC') }    # 最も新しいマイクロポストを最初に表示する（逆順）
    validates :user_id, presence: true
end
