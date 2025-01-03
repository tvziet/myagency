require 'ruby-progressbar'

puts "Cleaning existing pages..."
Page.destroy_all
MyAgencyInfo.destroy_all
Administrator.destroy_all

pages_data = [
  {
    name: "Trang chủ",
    english_name: "Home",
    slug: "trang-chu",
    english_slug: "home",
    content: "Đây là trang chủ",
    english_content: "This is home page",
    position: 1
  },
  {
    name: "Giới thiệu",
    english_name: "About",
    slug: "gioi-thieu",
    english_slug: "about",
    content: "Đây là trang giới thiệu",
    english_content: "This is about page",
    position: 2
  },
  {
    name: "Podcast",
    english_name: "Podcast",
    slug: "podcast",
    english_slug: "podcast",
    content: "Đây là trang podcast",
    english_content: "This is podcast page",
    position: 3
  },
  {
    name: "Business Coaching",
    english_name: "Business Coaching",
    slug: "business-coaching",
    english_slug: "business-coaching",
    content: "Đây là trang business coaching",
    english_content: "This is business coaching page",
    position: 4
  },
  {
    name: "Dental Agency",
    english_name: "Dental Agency",
    slug: "dental-agency",
    english_slug: "dental-agency",
    content: "Đây là trang dental agency",
    english_content: "This is dental agency page",
    position: 5
  },
  {
    name: "Blog",
    english_name: "Blog",
    slug: "blog",
    english_slug: "blog",
    content: "Đây là trang blog",
    english_content: "This is blog page",
    position: 6
  }
]

my_agency_info_data = [
  {
    address: "123 Đường ABC, Phường XYZ, Quận 12, TP. Hồ Chí Minh",
    english_address: "123 ABC Street, XYZ Ward, District 12, Ho Chi Minh City",
    email: "myagency@example.com",
    phone_number: "0123456789"
  }
]

admin_info_data = [
  {
    email: "admin@admin.com",
    password: "123123123"
  }
]

progressbar = ProgressBar.create(
  title: 'Creating Pages',
  total: pages_data.length,
  format: '%t: |%B| %p%% Complete (%c/%C) %e',
  progress_mark: '=',
  remainder_mark: ' '
)

pages_data.each do |pd|
  Page.create!(
    name: pd[:name],
    english_name: pd[:english_name],
    slug: pd[:slug],
    english_slug: pd[:english_slug]
  )
  progressbar.increment
end

puts "\nSeeds completed successfully!"
puts "Created #{Page.count} pages:"
Page.all.each do |page|
  puts "- #{page.name} (#{page.slug})"
end

progressbar = ProgressBar.create(
  title: 'Creating Myagency Info',
  total: my_agency_info_data.length,
  format: '%t: |%B| %p%% Complete (%c/%C) %e',
  progress_mark: '=',
  remainder_mark: ' '
)

my_agency_info_data.each do |m|
  MyAgencyInfo.create!(
    address: m[:address],
    english_address: m[:english_address],
    email: m[:email],
    phone_number: m[:phone_number]
  )
  progressbar.increment
end

puts "\nSeeds completed successfully!"
puts "Created #{MyAgencyInfo.count} Myagency Info:"
MyAgencyInfo.all.each do |m|
  puts "#{m.address}\n
        #{m.english_address}\n
        #{m.email}\n
        #{m.phone_number}"
end

progressbar = ProgressBar.create(
  title: 'Creating Admin User',
  total: admin_info_data.length,
  format: '%t: |%B| %p%% Complete (%c/%C) %e',
  progress_mark: '=',
  remainder_mark: ' '
)

admin_info_data.each do |admin|
  Administrator.create!(
    email: admin[:email],
    password: admin[:password]
  )
  progressbar.increment
end

puts "\nSeeds completed successfully!"
puts "Created #{Administrator.count} Admin Info:"
Administrator.all.map { |admin| puts "#{admin.email}" }
