# frozen_string_literal: true

media = ['Yahoo', 'ほいくる', '保育士バンク', 'スゴいい保育']
media.each do |medium|
  Media.create(name: medium);
end
