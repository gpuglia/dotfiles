# via @Arkham
task :default => [:backup_dir, :backup, :link]

DOTFILES = %w(
  editrc
  gemrc
  gitconfig
  gitignore
  inputrc
  irbrc
  pryrc
  tmux.conf
  vimrc
  zlogin
  zpreztorc
  zprofile
  zshrc
)

desc %(Make symlinks of dotfiles)
task :link do
  DOTFILES.each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join(DOTFILES_DIR, script), dotfile
    end
  end
end
