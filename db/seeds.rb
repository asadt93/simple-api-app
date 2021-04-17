# frozen_string_literal: true

# varticals
verticals = [{ name: 'Health & Fitness' }, { name: 'Business' }, { name: 'Music' }]

Vertical.destroy_all
verticals_db = []
verticals.each do |vertical|
  verticals_db << Vertical.create!(vertical)
end

# categories
categories = [
  {
    name: 'Booty & Abs',
    vertical_id: verticals_db[0].id,
    state: 'active'
  },
  {
    name: 'Full Body',
    vertical_id: verticals_db[0].id,
    state: 'active'
  },
  {
    name: 'Advertising',
    vertical_id: verticals_db[1].id,
    state: 'active'
  },
  {
    name: 'Writing',
    vertical_id: verticals_db[1].id,
    state: 'active'
  },
  {
    name: 'Singing',
    vertical_id: verticals_db[2].id,
    state: 'active'
  },
  {
    name: 'Music Fundamentals',
    vertical_id: verticals_db[2].id,
    state: 'active'
  }
]

Category.destroy_all
categories_db = []
categories.each do |category|
  categories_db << Category.create!(category)
end

# courses
courses = [
  {
    name: 'Loose the Gutt, keep the Butt',
    author: 'Anowa',
    category_id: categories_db[0].id
  },
  {
    name: 'BrittneBabe Fitness Transformation',
    author: 'Brittnebabe',
    category_id: categories_db[0].id
  },
  {
    name: 'BTX: Body Transformation Extreme',
    author: 'Barstarzz',
    category_id: categories_db[1].id
  },
  {
    name: 'Facebook Funnel Marketing',
    author: 'Russell Brunson',
    category_id: categories_db[1].id
  },
  {
    name: 'Build a Wild Audience',
    author: 'Tim Nilson',
    category_id: categories_db[2].id
  },
  {
    name: 'Editorial Writing Secrets',
    author: 'J. K. Rowling',
    category_id: categories_db[3].id
  },
  {
    name: 'Scientific Writing',
    author: 'Stephen Hawking',
    category_id: categories_db[3].id
  },
  {
    name: 'Vocal Training 101',
    author: 'Linkin Park',
    category_id: categories_db[4].id
  },
  {
    name: 'Music Production',
    author: 'Lady Gaga',
    category_id: categories_db[4].id
  },
  {
    name: 'Learn the Piano',
    author: 'Lang Lang',
    category_id: categories_db[5].id
  },
  {
    name: 'Become a guitar hero',
    author: 'Jimmy Page',
    category_id: categories_db[5].id
  }
]

courses.each do |course|
  Course.create!(course)
end

User.destroy_all
User.create!(name: 'User', email: 'user@test.com', password: 'user')
