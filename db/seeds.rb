# frozen_string_literal: true

media = ['Yahoo', 'ほいくる', '保育士バンク']
media.each do |medium|
  Media.create(name: medium);
end
