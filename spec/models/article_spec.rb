require 'rails_helper'

RSpec.describe Article, :type => :model do
  let(:article_attributes) do {
    title: "A very good title",
    text: "A very good text"
  }
  end
  context "when creates an article" do
    it "successfully creates one with the arguments" do
      article = Article.create(title: "A very good title", text: "A very good description of the article")
      expect(article.errors).to be_empty
      article.save!
      expect(Article.find(article.id)).to eq(article)
    end

    it "fails when title is too short" do
      article = Article.create(title: "Sh", text: "A very good text")
      expect(article.errors).to_not be_empty
    end
  end
end
