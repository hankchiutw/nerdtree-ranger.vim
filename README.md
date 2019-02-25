# nerdtree-ranger.vim

Add ranger-like key binding to NERDTree.

Currently this only implements [ranger movement](https://github.com/ranger/ranger/wiki/Official-user-guide#movement).

## Installation

Install [NERDTree](https://github.com/scrooloose/nerdtree) first.

### Via Plugin Manager (Recommended)

#### [Vim-Plug](https://github.com/junegunn/vim-plug)

1. Add `Plug 'hankchiutw/nerdtree-ranger.vim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:PlugInstall`

#### [Vundle](https://github.com/VundleVim/Vundle.vim) or similar

1. Add `Plugin 'hankchiutw/nerdtree-ranger.vim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:BundleInstall`

#### [NeoBundle](https://github.com/Shougo/neobundle.vim)

1. Add `NeoBundle 'hankchiutw/nerdtree-ranger.vim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:NeoUpdate`

#### [Pathogen](https://github.com/tpope/vim-pathogen)

```sh
cd ~/.vim/bundle
git clone https://github.com/hankchiutw/nerdtree-ranger.vim.git
```

### Manual Installation

#### Unix

(For Neovim, change `~/.vim/` to `~/.config/nvim/`.)

```sh
curl -fLo ~/.vim/plugin/reload.vim --create-dirs \
  https://raw.githubusercontent.com/hankchiutw/nerdtree-ranger.vim/master/plugin/reload.vim
curl -fLo ~/.vim/ftplugin/dart.vim --create-dirs \
  https://raw.githubusercontent.com/hankchiutw/nerdtree-ranger.vim/master/ftplugin/dart.vim
```

#### Windows (PowerShell)

```powershell
md ~\vimfiles\plugin
md ~\vimfiles\doc
$pluguri = 'https://raw.githubusercontent.com/hankchiutw/nerdtree-ranger.vim/master/plugin/reload.vim'
$ftpluguri = 'https://raw.githubusercontent.com/hankchiutw/nerdtree-ranger.vim/master/ftplugin/dart.vim'
(New-Object Net.WebClient).DownloadFile($pluguri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\plugin\reload.vim"))
(New-Object Net.WebClient).DownloadFile($ftpluguri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\ftplugin\dart.vim"))
```

## Usage

Try `h` and `l` keys in your tree node.

### How it works

Since NERDTree has keymap API, you can implement your own keymap.

Refer to NERDTree's [ui_glue.vim](https://github.com/scrooloose/nerdtree/blob/master/autoload/nerdtree/ui_glue.vim)

(inspired from [ranger](https://github.com/ranger/ranger/wiki/Official-user-guide#movement))
