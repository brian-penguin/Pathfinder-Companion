require "rails_helper"

RSpec.describe "spells show page displays spell information" do
  before(:all) do
    51.times do
      FactoryGirl.create(:spell)
    end    
  end

  pending "spell show page links back to index"

  pending "spell show page lists relevant spell information"

  pending "spell show page displays spell requirements"

  pending "spell show page displays class level requirements"

  pending "spell show page links to a filtered spell page for a specific class"
  
end