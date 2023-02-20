require 'rails_helper'
require 'ffaker'

RSpec.describe User, type: :model do
  it 'is invalid is the level is not between 1 and 99' do
    expect(User.create(nickname: 'Chronos', kind: :wizard, level: 100)).to_not be_valid
  end
  it 'return the correct hero title' do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = 222
    teste = User.create(nickname: nickname, kind: kind, level: level)
    expect(teste.title).to eq("#{kind} #{nickname} ##{level}")
  end
end
