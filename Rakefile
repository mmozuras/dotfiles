require 'fileutils'

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

  task :iterm do
    system %{ /usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist }
    system %{ /usr/libexec/PlistBuddy -c "Merge 'iTerm2/Solarized Dark.itermcolors' :'Custom Color Presets':'Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist }

    color_scheme_file = File.join('iTerm2', "Solarized Dark.itermcolors")

    iTerm_profile_list.count.times { |idx| apply_theme_to_iterm_profile_idx idx, color_scheme_file }
  end

  private

  def iTerm_profile_list
    profiles=Array.new
    begin
      profiles <<  %x{ /usr/libexec/PlistBuddy -c "Print :'New Bookmarks':#{profiles.size}:Name" ~/Library/Preferences/com.googlecode.iterm2.plist 2>/dev/null}
    end while $?.exitstatus==0
    profiles.pop
    profiles
  end

  def apply_theme_to_iterm_profile_idx(index, color_scheme_path)
    values = Array.new
    16.times { |i| values << "Ansi #{i} Color" }
    values << ['Background Color', 'Bold Color', 'Cursor Color', 'Cursor Text Color', 'Foreground Color', 'Selected Text Color', 'Selection Color']
    values.flatten.each { |entry| system %{ /usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':#{index}:'#{entry}'" ~/Library/Preferences/com.googlecode.iterm2.plist } }

    system %{ /usr/libexec/PlistBuddy -c "Merge '#{color_scheme_path}' :'New Bookmarks':#{index}" ~/Library/Preferences/com.googlecode.iterm2.plist }
    system %{ defaults read com.googlecode.iterm2 }
  end

  def entries
    @files ||= Dir.entries( File.expand_path( '~/.dotfiles' ) ) - $exclude
  end

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
end
