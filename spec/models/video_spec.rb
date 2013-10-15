require 'spec_helper'

describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}

  describe "search_by_title" do
    it "returns an empty array if there is no match" do
      ironman = Video.create(title: "Iron man", description: "hero alter ego")
      superman = Video.create(title: "Superman", description: "human alter ego")
      expect(Video.search_by_title("no_match")).to eq([])
    end

    it "returns an array of one video for an exact match" do
      ironman = Video.create(title: "Iron man", description: "hero alter ego")
      superman = Video.create(title: "Superman", description: "human alter ego")
      expect(Video.search_by_title("Superman")).to eq([superman])
    end

    it "returns an array of one video for a partial match" do
      ironman = Video.create(title: "Iron man", description: "hero alter ego")
      superman = Video.create(title: "Superman", description: "human alter ego")
      expect(Video.search_by_title("perman")).to eq([superman])
    end

    it "returns an array of all matches ordered by created_at " do
      ironman = Video.create(title: "Iron man", description: "hero alter ego", created_at: 1.day.ago)
      superman = Video.create(title: "Superman", description: "human alter ego")
      expect(Video.search_by_title("man")).to eq([superman, ironman])
    end

    it "returns an empty array for a search with an empty string" do
      ironman = Video.create(title: "Iron man", description: "hero alter ego", created_at: 1.day.ago)
      superman = Video.create(title: "Superman", description: "human alter ego")
      expect(Video.search_by_title("")).to eq([])
    end
  end
end
