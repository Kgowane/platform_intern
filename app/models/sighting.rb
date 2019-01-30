class Sighting < ApplicationRecord
  belongs_to :animal
  enum region: {'zone 1' => 0, 'zone 2' => 1, 'zone 3' => 2, 'zone 4' => 3, 'zone 5' => 4, 'zone 6' => 5}
end
