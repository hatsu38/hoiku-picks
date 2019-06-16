# frozen_string_literal: true

namespace :get_article do
  YAHOO_URL = 'https://news.yahoo.co.jp/search/?p=保育&to=1'
  HOIKURU_URL = 'https://hoiclue.jp/asobi/'
  HOIKUSHIBANK_URL = 'https://www.hoikushibank.com/column/'
  SUGOII_URL = 'https://sugoii.florence.or.jp'
  IMAGE_ELE = 'meta[property="og:image"]'

  desc 'Yahoo!ニュースを取得して、保存する'
  task yahoo: :environment do
    # スクレイピングする要素を定義
    title_ele = 'h1'
    description_ele = '.yjDirectSLinkTarget'

    # 紐付けるメディア
    media_id = Media.find_by(name: 'Yahoo').id

    page = get_page(YAHOO_URL)
    article_links = get_aritlce_links(page, '#NSm .l.cf h2.t a')

    article_links.reverse_each do |url|
      page = get_page(url)
      title, description, image = get_article_element(page, title_ele, description_ele, IMAGE_ELE)
      Article.create!(title: title, description: description, image: image, url: url, media_id: media_id)
    rescue StandardError => e
      Rails.logger.warn(e.inspect + url)
      next
    end
  end

  desc '保育士バンクのコラムを取得して、保存する'
  task hoikushi_bank: :environment do
    # スクレイピングする要素を定義
    title_ele = 'div.heading.heading--border h2'
    description_ele = 'div.column__detail div.post-body'

    # 紐付けるメディア
    media_id = Media.find_by(name: '保育士バンク').id

    page = get_page(HOIKUSHIBANK_URL)
    article_links = get_aritlce_links(page, 'div.new__article div.article-introduction a')

    article_links.reverse_each do |article_url|
      url = 'https://www.hoikushibank.com' + article_url
      page = get_page(url)
      title, description, image = get_article_element(page, title_ele, description_ele, IMAGE_ELE)
      Article.create!(title: title, description: description, image: image, url: url, media_id: media_id)
    rescue StandardError => e
      Rails.logger.warn(e.inspect + url)
      next
    end
  end

  desc 'Hoikuruの遊びを取得して、保存する'
  task hoikuru: :environment do
    # スクレイピングする要素を定義
    title_ele = 'h1.post-header-title'
    description_ele = '#post_content'

    # 紐付けるメディア
    media_id = Media.find_by(name: 'ほいくる').id

    page = get_page(HOIKURU_URL)
    article_links = get_aritlce_links(page, 'h3.postList-item-title a.postList-item-link')

    article_links.reverse_each do |article_url|
      url = 'https://hoiclue.jp' + article_url
      page = get_page(url)
      title, description, image = get_article_element(page, title_ele, description_ele, IMAGE_ELE)
      Article.create!(title: title, description: description, image: image, url: url, media_id: media_id)
    rescue StandardError => e
      Rails.logger.warn(e.inspect + url)
      next
    end
  end

  desc 'スゴいい保育から記事を取得して、保存する'
  task sugoii_hoiku: :environment do
    # スクレイピングする要素を定義
    title_ele = 'h1'
    description_ele = '#main'

    # 紐付けるメディア
    media_id = Media.find_by(name: 'スゴいい保育').id

    page = get_page(SUGOII_URL)
    article_links = get_aritlce_links(page, '#article_list li a')

    article_links.reverse_each do |article_url|
      url = SUGOII_URL + article_url
      page = get_page(url)
      title, description, image = get_article_element(page, title_ele, description_ele, IMAGE_ELE)
      Article.create!(title: title, description: description, image: image, url: url, media_id: media_id)
    rescue StandardError => e
      Rails.logger.warn(e.inspect + url)
      next
    end
  end
end

def get_page(url)
  agent = Mechanize.new
  agent.get(url)
end

def get_aritlce_links(page, a_tags_path)
  articles_a_tags = page.search(a_tags_path)
  articles_a_tags ? articles_a_tags.map { |articles_a_tag| articles_a_tag.get_attribute(:href) } : nil
end

def get_article_element(page, title_ele, description_ele, image_ele)
  title = page.at(title_ele).inner_text.strip
  description = page.at(description_ele).inner_text.strip.truncate(300)
  thumnail = page.at(image_ele)
  image = thumnail ? thumnail[:content] : nil
  return title, description, image
end
