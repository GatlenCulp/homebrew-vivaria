class Vivaria < Formula
  include Language::Python::Virtualenv
  desc "Task environment setup tool for AI research"
  # AUTHORS: METR <info@metr.org>
  homepage "https://vivaria.metr.org/"
  url "https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.1.tar.gz"#, tag: "v0.1.0"
  version "0.1.0" # TODO: Grab the version from the tag(?)
  sha256 "3360781d374e010e2b6c7a86b2cc5a91b51d6b2c5337d14788858a719af943d2"
  license "MIT"
  head "https://github.com/METR/vivaria.git", branch: "main"

  # TODO: Make these options work
  # option "with-dev-mode", "Install Vivaria for development of the software itself."
  # option "without-cli", "Only install the Docker setup scripts and not the CLI."

  # This was fixed after I ran `brew link docker`
  depends_on "docker" => :run
  depends_on "docker-compose" => :run
  depends_on "python@3.11"

  DEV_MODE = false

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

  def install

    # Copy everything except certain directories
    prefix.install Dir["*"]
    prefix.install Dir[".*"].select { |f| File.file?(f) }

    # Exclude specific directories if they exist
    rm_rf prefix/".devcontainer"
    rm_rf prefix/".github"
    rm_rf prefix/".vscode"

    # Set permissions for scripts
    # chmod 0755, prefix/"scripts/setup-docker-compose.sh"
    # chmod 0755, prefix/"scripts/configure-cli-for-docker-compose.sh"

    # These scripts must be run in the prefix directory to generate the files in the correct location
    Dir.chdir(prefix) do
      # TODO: Check if libxec is a better way to run these scripts
      # TODO: Check if it is better to set up docker compose in etc since these are configuration files.
      system "./scripts/setup-docker-compose.sh"
      raise "Setup script failed" unless $?.success?
      
      # NOTE: Viv must be available via the command line before this is run.
      # system "./scripts/configure-cli-for-docker-compose.sh"
      # raise "Configuration script failed" unless $?.success?
    end

    # def cli_setup
    #   # TODO: Set up a "developer install" of the CLI. Is this useful or should they just work from a cloned repo?
    #   Dir.chdir(prefix) do

    #     venv = libexec/"venv"
    #     ENV["VIRTUAL_ENV"] = venv
    #     venv.mkpath
    #     system "python3", "-m", "venv", venv
      
    #     with_env(PATH: "#{venv}/bin:#{ENV["PATH"]}") do
    #       system "#{venv}/bin/pip", "install", "-v", "--no-deps", buildpath/"cli"
    #     end
      
    #     # Create the wrapper script in the bin directory
    #     (bin/"viv").write <<~EOS
    #       #!/bin/bash
    #       VENV_PATH="#{venv}"
    #       source "$VENV_PATH/bin/activate"
    #       "$VENV_PATH/bin/viv" "$@"
    #       deactivate
    #     EOS
    #     chmod 0755, bin/"viv"
    #   end

    (etc/"vivaria").mkpath

  end

  # Information displayed after installation
  def caveats
    <<~EOS
      Post-installation instructions:

      To set up and run the Docker server, run:
        viv setup-docker-compose

      For more information, visit:
        https://vivaria.metr.org/
    EOS
  end

  test do
    # TODO: Make this test work.
    output = shell_output("#{bin}/viv --version")
    assert_match "vivaria version #{version}", output.strip
  end
end
