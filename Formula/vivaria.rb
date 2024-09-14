class Vivaria < Formula
  # A brief description of the software
  desc "Task environment setup tool for AI research"
  
  # The official website of the software
  homepage "https://vivaria.metr.org/"
  
  # URL to the tarball of the release
  # This should point to a specific version, not a branch
  # This gets put into the temporary $(brew --cache)/downloads directory
  # Then gets extracted into $(brew --cache)/vivaria--[version].tar.gz/ directory
  # Install is then relied on to copy the necessary files to the Cellar
  url "https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.0.tar.gz"
  
  # SHA256 checksum of the tarball for security verification
  # Generate this with: curl -L <tarball_url> | shasum -a 256
  sha256 "eabcf6b3d0d63ba37cd6af03c0566e981d333b5a06fd38dd61102e9f72941ecd"
  
  # The license of the software
  license "MIT"

  # Dependencies required to run the software
  # Brew will make sure these are installed before installing the software
  # `:run` means these are runtime dependencies
  # This was fixed after I ran `brew link docker`
  depends_on "docker" => :run
  depends_on "docker-compose" => :run

  

  # The installation method
  # Brew tracks the files installed by the formula. But only removes files in the prefix directory
  # Cellar is within the prefix directory for formulas.
  def install
    # binding.pry for debugging, not set up yet
    # Create necessary directories in the Cellar
    # The `prefix` variable refers to the root directory of this formula in the Cellar
    (prefix/"scripts").mkpath
    (prefix/"docker").mkpath

    # These commands are ruby methods wrapping shell commands
    # Copy the setup scripts to the Cellar
    # The `buildpath` refers to the directory where the tarball was extracted

    # Copy everything except certain directories
    prefix.install Dir["*"]
    prefix.install Dir[".*"].select { |f| File.file?(f) }

    # Exclude specific directories if they exist
    rm_rf prefix/".devcontainer"
    rm_rf prefix/".github"
    rm_rf prefix/".vscode"

    # # Create necessary symlinks
    # bin.install_symlink prefix/"scripts/setup-docker-compose.sh" => "vivaria-setup"
    # bin.install_symlink prefix/"scripts/configure-cli-for-docker-compose.sh" => "vivaria-cli-setup"

    # # Set permissions for scripts
    # chmod 0755, prefix/"scripts/setup-docker-compose.sh"
    # chmod 0755, prefix/"scripts/configure-cli-for-docker-compose.sh"

    # etc = editable text configurations
    # It is non-standard for homebrew to use ~/.config or ~/.<name> for configuration
    # Rather, it prefers to use /opt/homebrew/etc/<name> or /usr/local/etc/<name>
    # Create a directory for user configurations
    (etc/"vivaria").mkpath

    # If there's a default configuration file, copy it to the etc directory
    # cp buildpath/"config.default", etc/"vivaria/config" if File.exist? buildpath/"config.default"
  end

  # Information displayed after installation
  def caveats
    <<~EOS
      TODO: Add post-installation instructions here
      This will include steps to set up and run the Docker server
    EOS
  end

  # Test to ensure the formula was installed correctly
  test do
    # TODO: Add a simple test to check if the installation was successful
  end
end