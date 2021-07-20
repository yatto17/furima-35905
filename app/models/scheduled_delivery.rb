class ScheduledDelivery < ActiveHash::Base
  self.data = [
    { id: 1, days: '---' },
    { id: 2, days: '1~2日で発送' },
    { id: 3, days: '2~3日で発送' },
    { id: 4, days: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
  
end