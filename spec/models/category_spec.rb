require 'spec_helper'

describe Category do
  it { should have_many(:videos)}
  it { should validate_presence_of(:name) }

  describe "#recent_videos" do
    it "returns the videos in the reverse chronical order by created_at" do
      fantasy = Category.create(name: "fantasy")
      superman = Video.create(title: "Superman", description: "alien movie", category: fantasy, created_at: 1.day.ago)
      ironman = Video.create(title: "Iron Man", description: "tech movie", category: fantasy)
      expect(fantasy.recent_videos).to eq([ironman, superman])
    end

    it "returns all the videos is there are less than 6 videos" do
      fantasy = Category.create(name: "fantasy")
      superman = Video.create(title: "Superman", description: "alien movie", category: fantasy, created_at: 1.day.ago)
      ironman = Video.create(title: "Iron Man", description: "tech movie", category: fantasy)
      expect(fantasy.recent_videos.count).to eq(2)
    end

    it "returns only 6 videos if there are more than 6 videos" do
      fantasy = Category.create(name: "fantasy")
      7.times { Video.create(title: "foo", description: "bar", category: fantasy) }
        expect(fantasy.recent_videos.count).to eq(6)
    end
    it " returns the most recent 6 videos" do
      fantasy = Category.create(name: "fantasy")
      6.times { Video.create(title: "foo", description: "bar", category: fantasy) }
      batman = Video.create(title: "Batman", description: "crime movie", category: fantasy, created_at: 1.day.ago)
        expect(fantasy.recent_videos).not_to include(batman)
    end
    it "returns an empty array if the category does not have any videos" do
      fantasy = Category.create(name: "fantasy")
      expect(fantasy.recent_videos).to eq([])
    end
  end

end
