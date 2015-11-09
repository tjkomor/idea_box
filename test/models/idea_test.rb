require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "idea must have name and description" do
    skip
    idea = Idea.create(name: 'keep slota wild',
                    description: 'do it')

    assert idea.valid?
  end
end
