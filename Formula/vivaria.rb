require "English"
class Vivaria < Formula
  include Language::Python::Virtualenv
  desc "Task environment setup tool for AI research"
  homepage "https://vivaria.metr.org/"
  # Stable release
  url "https://github.com/GatlenCulp/vivaria.git",
    using:    :git,
    tag:      "v0.1.5",
    revision: "4ed7a79da3e79f9d48a43cb362ae272ec3259f72"
  license "MIT"
  # Development release
  head "https://github.com/GatlenCulp/vivaria.git",
    branch: "main"

  # Automatically check for new versions
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  # docker compose is required for running task environments, but not included in deps.
  # Check CONTRIBUTING.md for this reasoning.
  depends_on "python@3.11" => :build
  depends_on "rust" => :build # Needed for pydantic

  # TODO: Add bottle block for pre-built binaries
  # bottle do
  #   ...
  # end

  # Define python dependencies to be installed into the virtualenv

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/b0/ee/9b19140fe824b367c04c5e1b369942dd754c4c5462d5674002f75c4dedc1/certifi-2024.8.30.tar.gz"
    sha256 "bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "fire" do
    url "https://files.pythonhosted.org/packages/1b/1b/84c63f592ecdfbb3d77d22a8d93c9b92791e4fa35677ad71a7d6449100f8/fire-0.6.0.tar.gz"
    sha256 "54ec5b996ecdd3c0309c800324a0703d6da512241bc73b553db959d98de0aa66"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/00/6f/93e724eafe34e860d15d37a4f72a1511dd37c43a76a8671b22a15029d545/idna-3.9.tar.gz"
    sha256 "e5c5dafde284f26e9e0f28f6ea2d6400abd5ca099864a67f576f3981c6476124"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/14/15/3d989541b9c8128b96d532cfd2dd10131ddcc75a807330c00feb3d42a5bd/pydantic-2.9.1.tar.gz"
    sha256 "1363c7d975c7036df0db2b4a61f2e062fbc0aa5ab5f2772e0ffc7191a4f4bce2"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/5c/cc/07bec3fb337ff80eacd6028745bd858b9642f61ee58cfdbfb64451c1def0/pydantic_core-2.23.3.tar.gz"
    sha256 "3cb0f65d8b4121c1b015c60104a685feb929a29d7cf204387c7f2688c7974690"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "sentry-sdk" do
    url "https://files.pythonhosted.org/packages/3c/23/6527e56fb17817153c37d702d6b9ed0a2f75ed213fd98a176c1b8894ad20/sentry_sdk-2.14.0.tar.gz"
    sha256 "1e0e2eaf6dad918c7d1e0edac868a7bf20017b177f242cefe2a6bcd47955961d"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/10/56/d7d66a84f96d804155f6ff2873d065368b25a07222a6fd51c4f24ef6d764/termcolor-2.4.0.tar.gz"
    sha256 "aab9e56047c8ac41ed798fa36d892a37aca6b3e9159f3e0c24bc64a9b3ac7b7a"
  end

  resource "typeguard" do
    url "https://files.pythonhosted.org/packages/8d/e1/3178b3e5369a98239ed7301e3946747048c66f4023163d55918f11b82d4e/typeguard-4.3.0.tar.gz"
    sha256 "92ee6a0aec9135181eae6067ebd617fd9de8d75d714fb548728a4933b1dea651"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ed/63/22ba4ebfe7430b76388e7cd448d5478814d3032121827c12a2cc287e2260/urllib3-2.2.3.tar.gz"
    sha256 "e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9"
  end

  def check_for_docker_compose
    docker_compose_installed = false
    docker_compose_version = nil

    # Try to get the user's actual PATH
    user_path = `
    source ~/.zshrc 2>/dev/null || \
    source ~/.bash_profile 2>/dev/null || \
    source ~/.profile 2>/dev/null && \
    echo $PATH
  `.strip

    ohai "Current Homebrew PATH: #{ENV["PATH"]}"
    # Does not work
    # ohai "User's shell PATH: #{user_path}"

    # List of possible Docker binary locations
    docker_paths = [
      "/usr/local/bin/docker-compose",
      "/opt/homebrew/bin/docker-compose",
      "#{Dir.home}/bin/docker-compose",
      "/Applications/Docker.app/Contents/Resources/bin/docker-compose",
    ]

    # Does not work
    # Add paths from user's PATH
    # docker_paths += user_path.split(":")

    docker_path = docker_paths.uniq.find { |path| File.executable?(path) }

    if docker_path
      ohai "Docker Compose binary found at: #{docker_path}"
      docker_compose_version = `#{docker_path} version 2>&1`.strip
      docker_compose_installed = $CHILD_STATUS.success?

      if docker_compose_installed
        ohai "Detected Version: #{docker_compose_version}"
      else
        opoo "Docker Compose command failed. Output: #{docker_compose_version}"
      end
    else
      opoo "Docker binary not found in expected locations or user PATH"
    end

    unless docker_compose_installed
      odie <<~EOS

        Vivaria installation failed.

        Docker Compose is not detected on your system.
          Docker Compose is required to run task environments for Vivaria.

        You can install Docker Desktop for Mac, which includes Docker Compose, with:
          #{style_command("brew install --cask docker")}

        Once installed, you may have to restart your computer and check if
          docker compose is available by running:
          #{style_command("docker compose version")}

        Note that Vivaria requires version > 2.0 of docker compose
          indicated by the syntax #{style_command("docker compose")} instead of #{style_command("docker-compose")}.
          read more at https://docs.docker.com/compose/releases/migrate/

      EOS
    end
  end

  def install
    # Check for Docker Compose
    check_for_docker_compose

    # Install manpage
    man1.install buildpath/"cli/viv_cli/viv.1"
    # Install documentation
    doc.install Dir["docs/*"]
    doc.install "README.md"
    doc.install "LICENSE"
    doc.install "CONTRIBUTING.md"
    # Install dependencies and the CLI in a virtualenv
    venv = virtualenv_create(libexec/"venv", "python3.11")
    venv.pip_install resources
    venv.pip_install buildpath/"cli"
    bin.install libexec / "venv/bin/viv"
    # Clean up unnecessary directories
    rm_r ".devcontainer"
    rm_r ".github"
    rm_r ".vscode"
    rm_r "cli"
    rm_r "docs"
    rm_r "ignore"
    # Copy remaining files to vivaria directory
    src_dir = prefix/"vivaria"
    src_dir.mkpath
    dot_files = [".", ".."]
    src_dir.install Dir["*", ".*"].reject { |f| dot_files.include?(File.basename(f)) }
    # Create etc directory for configuration files (none yet)
    # (etc/"vivaria").mkpath
  end

  def prompt_for_api_key
    loop do
      ohai "🔑 Please enter your OpenAI API key:"
      api_key = $stdin.gets.chomp

      if api_key.start_with?("sk-") && api_key.length > 20
        return api_key
      else
        opoo "❌ The provided OpenAI API key doesn't appear to be valid."
        puts "Expected to start with 'sk-' and have length greater than 20"
        puts "Please try again."
      end
    end
  end

  def style_command(text)
    "\e[31m\e[40m#{text}\e[0m"
  end

  def style_shortcut(text)
    "\e[94m#{text}\e[0m"
  end

  def viv_setup
    # NOTE: Brew does not have permissions to edit or remove files outside of the Homebrew prefix
    # This function does not work, but could be fixed if config.json is moved to the Homebrew prefix
    config_file_path = File.expand_path("~/.config/viv-cli/config.json")
    brew_prefix = HOMEBREW_PREFIX.to_s

    loop do
      config_exists = File.exist?(config_file_path)

      if config_exists
        ohai "⚙️ A viv-cli configuration file already exists at #{config_file_path}."
        ohai "Brew does not have permissions to edit or remove files outside of #{brew_prefix}."
        ohai "Please delete or rename this file manually. You can use one of the following commands:"
        puts "  To delete: #{style_command("rm #{config_file_path}")}"
        puts "  To rename: #{style_command("mv #{config_file_path} #{config_file_path}.backup")}"
        ohai "Once you have done so, press Enter to continue or Ctrl+C to abort the post-install process."

        $stdin.gets # Wait for user input

        if File.exist?(config_file_path)
          opoo "The configuration file still exists. Please remove or rename it before continuing."
        else
          ohai "No existing viv-cli configuration found. Continuing with installation"
          break # Exit the loop if the file no longer exists
        end
      else
        ohai "No existing viv-cli configuration found."
        ohai "Would you like to run 'viv setup' to create a new configuration? [y/N]"
        response = $stdin.gets.chomp.downcase
        break if response == "y"

        ohai "Exiting viv setup. You can run it manually later with 'viv setup'."
        return
      end
    end

    config_dir = File.dirname(config_file_path)
    mkdir_p(config_dir) unless File.directory?(config_dir)
    system "sudo", "chown", "-R", ENV["USER"], config_dir
    system "sudo", "chmod", "755", config_dir

    api_key = prompt_for_api_key

    setup_command = "viv setup --openai-api-key #{api_key}"
    ohai "Running: #{style_command(setup_command)}"

    output = `#{setup_command} 2>&1`
    status = $CHILD_STATUS.success?

    if status
      ohai "viv setup completed successfully."
    else
      opoo "viv setup encountered an error. Output:"
      puts output
    end
  end

  def build_docker_images
    # Prompt user to build Docker images
    ohai "🐳 Would you like to build the required Vivaria Docker images now? (This may take 3-8 minutes) [y/N]"
    response = $stdin.gets.chomp.downcase

    if response == "y"
      ohai "Opening Docker..."
      case RUBY_PLATFORM
      when /darwin/
        system "open", "-a", "Docker"
      when /linux/
        system "systemctl", "--user", "start", "docker-desktop"
      when /mingw|mswin/
        system "start", "Docker Desktop"
      else
        opoo "Unsupported platform for automatic Docker startup. Please ensure Docker is running manually."
      end

      # Wait for Docker to start
      ohai "Waiting for Docker to start..."
      30.times do
        break if system("docker info > /dev/null 2>&1")

        sleep 1
      end

      ohai "Building Docker images..."
      system "viv", "docker", "compose", "build"

      if $CHILD_STATUS.success?
        ohai "Docker images built successfully."
      else
        opoo "Failed to build Docker images. You can try building them later with 'viv docker compose build'."
      end

    else
      ohai "Skipping Docker image build. You can build them later with 'viv docker compose build'."
    end
  end

  def post_install
    # Run 'viv setup' (Note: This does not work due to permissions)
    # viv_setup
    # Build Docker images (Note: This requires viv setup to have run successfully)
    # build_docker_images
  end

  def caveats
    <<~EOS

      🪴 Vivaria has been installed.

      🛠️ To complete setup, run
          #{style_command("viv setup")}

      ℹ️ For more information, visit:
           https://vivaria.metr.org/

    EOS
  end

  # TODO: Check if this works
  test do
    # Check if the command-line tool is installed and runs without error
    system bin/"viv", "version"
    # Check if the documentation files are installed
    assert_predicate doc/"README.md", :exist?
    assert_predicate doc/"LICENSE", :exist?
    assert_predicate doc/"CONTRIBUTING.md", :exist?
    # Check if the Vivaria directory is created
    assert_predicate prefix/"vivaria", :directory?
    # Check if the etc directory is created
    assert_predicate etc/"vivaria", :directory?
  end
end
