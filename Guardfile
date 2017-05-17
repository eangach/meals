# Acceptance test
guard :minitest, test_folders: 'test/acceptance', test_file_patterns: '*_test.rb' do
  watch(%r{^test/acceptance/(.*)_test\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "test/acceptance/#{m[1]}_test.rb" }
  watch(%r{^test/acceptance/test_helper\.rb$}) { 'test/acceptance' }
end
