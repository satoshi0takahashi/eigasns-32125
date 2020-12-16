class Country < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '日本映画:実写' }, { id: 3, name: '海外映画:実写' }, { id: 4, name: '日本映画:アニメ' },
    { id: 5, name: '海外映画:アニメ' }
  ]

  include ActiveHash::Associations
  has_many :movies
end