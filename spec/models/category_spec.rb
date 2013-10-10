require 'spec_helper'

describe Category do
  it { should have_many(:videos)}

  #it "saves itself" do
    #category = Category.new(name: "pron")
    #category.save
    #expect(Category.first).to eq(category)
  #end

  #it "has many videos" do
    #pron = Category.create(name: "pron")
    #orgy_pimps = Video.create(title: "orgy pimps", description: "pure debauchary")
    #orgy_pimps_2 = Video.create(title: "orgy pimps 2", description: "even more debauchary")
    #pron.videos << orgy_pimps
    #pron.videos << orgy_pimps_2
    ##expect(pron.videos).to include(orgy_pimps, orgy_pimps_2)
    #expect(pron.videos).to eq([orgy_pimps, orgy_pimps_2])
  #end
end
