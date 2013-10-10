require 'spec_helper'

describe Video do
  it { should have_many(:categories)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}

  # only test code that you own .. not rails
  #it "saves itself" do
    #video = Video.new(title: "akira", description: "pure sickness!")
    #video.save
    #expect(Video.first).to eq(video)
    # or ..
    #Video.first.should == video
    #Video.first.should eq(video)
  #end
  #it "has many categories" do
    #akira = Video.create(title: "akira", description: "pure sickness")
    #anime = Category.create(name: "anime")
    #scifi = Category.create(name: "scifi")
    #akira.categories << anime
    #akira.categories << scifi
    #expect(akira.categories).to eq([anime, scifi])
  #end

  #it "does not save a video without a title" do
    #video = Video.create(description: "a hot video")
    #expect(Video.count).to eq(0)
  #end
  it { should validate_presence_of(:description)}
  #it "does not save a video without a description" do
    #video = Video.create(title: "final fantasy")
    #expect(Video.count).to eq(0)
  #end
end
