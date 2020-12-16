class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'SF' },
    { id: 4, name: 'アドベンチャー' },
    { id: 5, name: 'ファミリー' },
    { id: 6, name: 'コメディ' },
    { id: 7, name: 'サスペンス' },
    { id: 8, name: 'ホラー' },
    { id: 9, name: 'パニック' },
    { id: 10, name: 'ラブロマンス' },
    { id: 11, name: 'ヒューマンドラマ' },
    { id: 12, name: '学園/青春' },
    { id: 13, name: 'スポーツ' },
    { id: 14, name: '伝記' },
    { id: 15, name: 'ミュージカル' },
    { id: 16, name: 'ドキュメンタリー' },
    { id: 17, name: '戦争' },
    { id: 18, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :movies
  end