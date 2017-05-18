# Unbit test
guard :minitest, test_folders: 'test/unit', test_file_patterns: '*_test.rb' do
  watch(%r{^test/unit/(.*)_test\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "test/unit/#{m[1]}_test.rb" }
  watch(%r{^test/unit/test_helper\.rb$}) { 'test/unit' }
end

# Acceptance test
guard :minitest, test_folders: 'test/acceptance', test_file_patterns: '*_test.rb' do
  watch(%r{^test/acceptance/(.*)_test\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "test/acceptance/#{m[1]}_test.rb" }
  watch(%r{^test/acceptance/test_helper\.rb$}) { 'test/acceptance' }
end
