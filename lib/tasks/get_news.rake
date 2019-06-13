# frozen_string_literal: true

namespace :get_article do
  YAHOO_URL = 'https://news.yahoo.co.jp/search/?p=保育&to=1'
  HOIKURU_URL = 'https://hoiclue.jp/asobi/'
  HOIKUSHIBANK_URL = 'https://www.hoikushibank.com/column/'

  desc 'Yahoo!ニュースを取得して、保存する'
  task yahoo: :environment do
    page = get_page(YAHOO_URL)

    news_a_tags = page.search('#NSm .l.cf h2.t a')
    news_links = news_a_tags ? news_a_tags.map { |news_a_tag| news_a_tag.get_attribute(:href) } : nil
    news_links.reverse_each do |news_url|
      agent = Mechanize.new
      page = agent.get(news_url)
      title = page.at('h1').inner_text.strip
      description = page.at('.yjDirectSLinkTarget').inner_text.strip.truncate(300)
      thumnail = page.at('meta[property="og:image"]')
      image = thumnail ? thumnail[:content] : nil
      Article.create!(title: title, description: description, image: image, url: news_url)
      rescue StandardError => e
        Rails.logger.warn(e.inspect + url)
        next
      end
    end
  end

  desc 'Hoikuruの遊びを取得して、保存する'
  task hoikuru: :environment do
    page = get_page(HOIKURU_URL)

    articles_a_tags = page.search('h3.postList-item-title a.postList-item-link')
    article_links = articles_a_tags ? articles_a_tags.map { |articles_a_tag| articles_a_tag.get_attribute(:href) } : nil

    article_links.reverse_each do |article_url|
      agent = Mechanize.new
      url = 'https://hoiclue.jp' + article_url
      page = agent.get(url)
      title = page.at('h1.post-header-title').inner_text.strip
      description = page.at('#post_content').inner_text.strip.truncate(300)
      thumnail = page.at('meta[property="og:image"]')
      image = thumnail ? thumnail[:content] : nil
      Article.create!(title: title, description: description, image: image, url: url)
      rescue StandardError => e
        Rails.logger.warn(e.inspect + url)
        next
      end
    end
  end

  desc '保育士バンクのコラムを取得して、保存する'
  task hoikushi_bank: :environment do
    page = get_page(HOIKUSHIBANK_URL)

    articles_a_tags = page.search('div.new__article div.article-introduction a')
    article_links = articles_a_tags ? articles_a_tags.map { |articles_a_tag| articles_a_tag.get_attribute(:href) } : nil

    article_links.reverse_each do |article_url|
      agent = Mechanize.new
      url = 'https://www.hoikushibank.com' + article_url
      puts(url)
      page = agent.get(url)
      title = page.at('div.heading.heading--border h2').inner_text.strip
      description = page.at('div.column__detail div.post-body').inner_text.strip.truncate(300)
      thumnail = page.at('meta[property="og:image"]')
      image = thumnail ? thumnail[:content] : nil
      Article.create!(title: title, description: description, image: image, url: url)
      rescue StandardError => e
        Rails.logger.warn(e.inspect + url)
        next
      end
    end
  end
end

def get_page(url)
  agent = Mechanize.new
  agent.get(url)
end
