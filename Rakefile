# via @Arkham
task :default => [:backup_dir, :backup, :link]

DOTFILES_DIR = "code/dotfiles"
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

# Files that live under ~/.config rather than the home directory.
# Maps "dotfile source" => "target path relative to ~".
XDG_DOTFILES = {
  "lazygit.yml" => ".config/lazygit/config.yml",
  "hunk.toml" => ".config/hunk/config.toml",
  "herdr/config.toml" => ".config/herdr/config.toml",
  "herdr/navigate.sh" => ".config/herdr/navigate.sh",
  "herdr/agent-jump.sh" => ".config/herdr/agent-jump.sh",
  "herdr/herdr-navigator.vim" => ".config/nvim/plugin/herdr-navigator.vim",
  "init.vim" => ".config/nvim/init.vim",
}

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

  XDG_DOTFILES.each do |source, target|
    dotfile = File.join(ENV['HOME'], target)
    if File.exist? dotfile
      warn "~/#{target} already exists"
    else
      mkdir_p File.dirname(dotfile)
      # Absolute source: a relative one would resolve from inside ~/.config/<app>/.
      ln_s File.join(ENV['HOME'], DOTFILES_DIR, source), dotfile
    end
  end
end
