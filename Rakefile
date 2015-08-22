require 'rake/testtask'

Rake::TestTask.new('test:all') do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/test*.rb']
  t.verbose = true
end

%w[graphs linked_lists].each do |name|
  Rake::TestTask.new("test:#{name}") do |t|
    t.libs << "test"
    t.test_files = FileList["test/#{name}/test*.rb"]
    t.verbose = true
  end
end

desc "Run tests"
task :default => 'test:all'
