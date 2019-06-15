# frozen_string_literal: true

media = ['Yahoo', '保育士バンク', 'ほいくる', 'スゴいい保育']
media.each do |medium|
  Media.create(name: medium);
end
