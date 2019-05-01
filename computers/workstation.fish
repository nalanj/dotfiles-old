#!/usr/bin/fish

# Make sure rpmfusion is installed
dnf install -q -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-(rpm -E %fedora).noarch.rpm

# Install packages
dnf install -q -y \
  git \
  vim \
  stow \
  sshfs \
  autofs \
  openscad \
  flatpak \
  gnome-tweak-tool \
  geary \
  curl \
  gnupg2 \
  libselinux-python \
  gnome-keyring \
  seahorse \
  adobe-source-code-pro-fonts \
  tmux \
  gnome-music \
  fish \
  task \
  speedcrunch \
  hub \
  compat-ffmpeg28 \
  ffmpeg-libs \
  python3-devel

# Install flatpaks
flatpak install flathub \
  org.telegram.desktop \
  com.bitwarden.desktop \
  org.gnome.Games \
  com.spotify.Client

# Install go
if ! test -d /usr/local/go
  set filename go1.12.4.linux-amd64.tar.gz
  curl -o /tmp/$filename https://dl.google.com/go/$filename

  tar xvzf /tmp/$filename -C /usr/local
end

# Configure sshfs
mkdir -p /etc/auto.master.d/
cp files/sshfs.autofs /etc/auto.master.d/sshfs.autofs
cp files/auto.sshfs /etc/auto.sshfs
systemctl restart autofs

# Install sam
sudo -u nalanj pip3 install --user aws-sam-cli
