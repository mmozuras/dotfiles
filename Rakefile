require 'fileutils'

# Files
def entries
  @files ||= Dir.entries( File.expand_path( '~/.dotfiles' ) ) - $exclude
end

# Files and folders which shouldn't be copied over
$exclude = [
  '.',
  '..',
  '.git',
  'bootstrap.sh',
  'Gemfile',
  'Gemfile.lock',
  'Rakefile',
  'README.md'
]

desc 'Update dotfiles repository.'
task :update do
  system 'git pull'
end

desc 'Run all install tasks in order.'
task :install => [ 'install:deps', 'install:copy' ]

namespace :install do

  desc 'Check for and install required dependencies.'
  task :deps do
    puts 'Please install bundler and re-run installation. http://gembundler.com/' and exit 1 unless system 'which bundle'
    system 'bundle install'
  end

  desc 'Copy dotfiles over to home dir.'
  task :copy do
    entries.each do | file |
      FileUtils.cp_r file, File.expand_path( "~/#{file}" ), :verbose => true, :remove_destination => true
    end
  end

  task :fonts do
    system "cp -f #{File.dirname(__FILE__)}/fonts/* $HOME/Library/Fonts"
  end

  task :zsh do
    if File.exists?("/usr/local/bin/zsh")
      if File.readlines("/private/etc/shells").grep("/usr/local/bin/zsh").empty?
        system %{ echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells }
      end
      system %{ chsh -s /usr/local/bin/zsh }
    else
      system %{ chsh -s /bin/zsh }
    end
  end
end
