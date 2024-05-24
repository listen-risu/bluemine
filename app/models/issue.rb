class Issue < ApplicationRecord
    belongs_to :user
    belongs_to :project

    enum tracker: {
        バグ: 0,
        機能: 1,
        サポート: 2
    }

    enum status: {
        新規: 0,
        進行中: 1,
        解決: 2,
        フィードバック: 3,
        終了: 4,
        却下: 5
    }

    enum priority: {
        低め: 0,
        通常: 1,
        高め: 2,
        急いで: 3,
        今すぐ: 4
    }

end
