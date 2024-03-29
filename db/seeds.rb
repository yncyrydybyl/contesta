# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
["audio", "visual", "interactive"].each do |cat|
    Category.find_or_create_by_name(cat)
end

open("db/platform.txt") do |platforms|
  platforms.read.each_line do |platform|
    name, shortname, description = platform.chomp.split("|")
    Platform.create!(:name => name, :shortname => shortname, :description => description)
  end
end

#["meego", "ios", "android"].each do |platform|
#  Platform.find_or_create_by_shortname

open("db/pages.txt") do |pages|
  pages.read.each_line do |page|
    name, permalink, content = page.chomp.split("|")
    Page.create!(:name => name, :permalink => permalink, :content => content)
  end
end
