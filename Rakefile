require 'bundler'
Bundler::GemHelper.install_tasks

@types = %w[rb]
namespace :whitespace do
  desc 'Removes trailing whitespace'
  task :cleanup do
    @types.each do |type|
      sh %{find . -name '*.#{type}' -exec sed -i '' 's/ *$//g' {} \\;}
    end
  end
  task :retab do
    @types.each do |type|
      sh %{find . -name '*.#{type}' -exec sed -i '' 's/\t/  /g' {} \\;}
    end
  end
end
