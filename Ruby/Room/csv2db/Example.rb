# coding:utf-8
require 'rubygems'
require 'activerecord-sqlserver-adapter'
require 'odbc'
require 'yaml'
require 'logger'

setting = YAML::load(File.open('connection.yml'))['development']
ActiveRecord::Base.logger = Logger.new('connection.log')

ActiveRecord::Base.establish_connection(
    adapter:      setting['adapter'],
    mode:         setting['mode'],
    host:         setting['host'],
    username:     setting['username'],
    password:     setting['password'],
    database:     setting['database'],
    dataserver:   setting['dataserver'],
    dsn:          setting['dsn'],
    port:         setting['port']
)

class Test < ActiveRecord::Base
  self.table_name = 'TestTable'
end

test = Test.new(Name: 'homu', Age: 13, Skill: 'stop the world')
test.save
Test.find(:all).each do |x|
  print x.Id, ' ', x.Name, ' ', x.Age, ' ', x.Skill, "\n"
end

File.open('Example.csv') do |detail|
  detail.each_line do |line|
    name, age, skill = line.split(',')
    Test.create(Name: name, Age: age, Skill: skill)
  end
end
