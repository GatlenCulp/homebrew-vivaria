class Vivaria < Formula
  desc "Vivaria task environment setup tool"
  homepage "https://vivaria.metr.org/"
  url "https://github.com/METR/vivaria.git", branch: "main"
  license "MIT"

  depends_on "docker"
  depends_on "python@3.9"
  depends_on "node"
  depends_on "typescript"

  def install
    # Clone the entire repository
    system "git", "clone", "--depth", "1", "https://github.com/METR/vivaria.git", "#{prefix}/vivaria"

    # Install Python dependencies
    system "pip3", "install", "-e", "#{prefix}/vivaria/cli"

    # Install setup scripts
    bin.install "#{prefix}/vivaria/scripts/vivaria-setup.sh" => "vivaria-setup"
    bin.install "#{prefix}/vivaria/scripts/vivaria-setup-cli.sh" => "vivaria-cli-setup"

    # Create a wrapper script for starting Vivaria services
    (bin/"vivaria-start").write <<~EOS
      #!/bin/bash
      set -e

      VIVARIA_PREFIX=$(brew --prefix vivaria)
      cd $VIVARIA_PREFIX/vivaria
      docker compose up -d

      echo "Vivaria services have been started."
    EOS

    chmod 0755, bin/"vivaria-start"
  end

  def caveats
    <<~EOS
      To complete setup, run the following commands:
        vivaria-setup
        vivaria-cli-setup

      To start Vivaria services:
        vivaria-start

      Then, open #{prefix}/vivaria/.env.server and set your OPENAI_API_KEY:
        OPENAI_API_KEY=your_key_here

      The 'viv' command should now be available. If it's not, you may need to add
      the Python user base's binary directory to your PATH.
    EOS
  end

  test do
    system "#{bin}/vivaria-setup", "--help"
    system "#{bin}/vivaria-cli-setup", "--help"
    system "#{bin}/vivaria-start", "--help"
  end
end
