# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def create_users quantity
  
  quantity.times do
    user = User.create([
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'password',
      confirmed_at: Time.now
    ])
    
  end

  puts 'Created: Users (Silent Fails)'
end

def create_organisation_types

  OrganisationType.create([
    {
      name: 'Company'
    },
    {
      name: 'School/University'
    },
    {
      name: 'Charity'
    },
    {
      name: 'Council'
    },
    {
      name: 'Government Dept.'
    },
  ])

end

def create_organisations quantity


  coke = Organisation.new()
  coke.name = "Coke"
  coke.organisation_type = OrganisationType.find_by_name('Company')
  coke.save

  apple = Organisation.new()
  apple.name = "Apple"
  apple.organisation_type = OrganisationType.find_by_name('Company')
  apple.save

  nike = Organisation.new()
  nike.name = "Nike"
  nike.organisation_type = OrganisationType.find_by_name('Company')
  nike.save

  impact = Organisation.new()
  impact.name = "Impact Hub"
  impact.organisation_type = OrganisationType.find_by_name('Company')
  impact.save

  council = Organisation.new()
  council.name = "Islington Council"
  council.organisation_type = OrganisationType.find_by_name('Council')
  council.save

  uni = Organisation.new()
  uni.name = "City University"
  uni.organisation_type = OrganisationType.find_by_name('School/University')
  uni.save


  Organisation.all.each do |organisation|
    
    organisation.address_line_1 = Faker::Address.street_address
    organisation.address_line_2 = Faker::Address.city
    organisation.address_line_3 = ''
    organisation.postcode = Faker::Address.postcode
    organisation.county_state = Faker::Address.state
    organisation.country = Faker::Address.country
    organisation.website = Faker::Internet.domain_name
    organisation.phone_number = Faker::PhoneNumber.phone_number
    organisation.email = Faker::Internet.email
    organisation.mission_statement = Faker::Company.bs

    organisation.save!

  end

  puts 'Created: Organisations (Silent Fails)'

end

def create_stories quantity

  posi_story = Story.new()
  posi_story.content = "
    test
  "
  posi_story.user = User.first
  posi_story.organisation = Organisation.find_by_name('Coke')
  posi_story.save!

  neg_story = Story.new()
  neg_story.content = "
    test
  "
  neg_story.user = User.first
  neg_story.organisation = Organisation.find_by_name('Coke')
  neg_story.save!

  quantity.times do
    story = Story.new(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraphs.join(' ')
    )

    story.user = User.order('RANDOM()').first
    story.organisation = Organisation.order('RANDOM()').first

    story.save!

  end

  puts 'Created: Stories (Noisy Fails)'

end

def create_story_questions quantity

  quantity.times do
    story_question = StoryQuestion.new(
      content: 'This is a story question.'
    )

    story_question.story = Story.order('RANDOM()').first
    
    story_question.save!

  end

  puts 'Created: Story Questions (Noisy Fails)'

end

def create_story_question_responses quantity

  quantity.times do
    story_question_response = StoryQuestionResponse.new(
      value: rand(2)
    )

    story_question_response.story_question = StoryQuestion.order('RANDOM()').first
    story_question_response.save!

  end

  puts 'Created: Story Question Responses (Noisy Fails)'

end

def create_relatibilities quantity

  quantity.times do
    relatability = Relatability.new(
      value: rand(2)
    )

    relatability.story = Story.order('RANDOM()').first
    relatability.save!

  end

  puts 'Created: Story Question Responses (Noisy Fails)'

end

create_users 20
create_organisation_types
create_organisations 20
create_stories 20
create_story_questions 60
create_story_question_responses 150
create_relatibilities 150
