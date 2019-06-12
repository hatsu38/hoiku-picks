# frozen_string_literal: true

namespace :news do
  desc 'ニュースを取得して、保存する'
  task get_news: :environment do
    agent = Mechanize.new
    yahoo_url = 'https://news.yahoo.co.jp/search/?p=保育&to=1'
    page = agent.get(yahoo_url)

    news_a_tags = page.search('#NSm .l.cf h2.t a')
    news_links = news_a_tags ? news_a_tags.map { |news_a_tag| news_a_tag.get_attribute(:href) } : nil
    news_links.reverse_each do |news_url|
      agent = Mechanize.new
      page = agent.get(news_url)

      title = page.at('h1').inner_text
      description = page.at('.yjDirectSLinkTarget').inner_text.truncate(300)
      thumnail = page.at('meta[property="og:image"]')
      image = thumnail ? thumnail[:content] : nil
      Article.create(title: title, description: description, image: image, url: news_url)
    rescue StandardError => e
      errors << {
        news_url: news_url,
        exception: e,
      }
    end
  end
end
