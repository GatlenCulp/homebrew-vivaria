class Vivaria < Formula
  include Language::Python::Virtualenv
  desc "Task environment setup tool for AI research"
  # AUTHORS: METR <info@metr.org>
  homepage "https://vivaria.metr.org/"
  url "https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.2.tar.gz"#, tag: "v0.1.0"
  version "0.1.0" # TODO: Grab the version from the tag(?)
  sha256 "2ad566ffd8836670dd5a5639b8f30efbbedf0fb76d250315aae9b38085188042"
  license "MIT"
  head "https://github.com/METR/vivaria.git", branch: "main"

  # TODO: Make these options work
  # option "with-dev-mode", "Install Vivaria for development of the software itself."
  # option "without-cli", "Only install the Docker setup scripts and not the CLI."

  # This was fixed after I ran `brew link docker`
  depends_on "docker" => :run
  depends_on "docker-compose" => :run
  depends_on "python@3.11"
  depends_on "rust" => :build # Needed for pydantic

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
    # Install dependencies and the CLI in a virtualenv
    venv = virtualenv_create(libexec/"venv", "python3.11")
    venv.pip_install resources
    venv.pip_install buildpath/"cli"
    
    # Install scripts (places in prefix/bin and HOMEBREW_PREFIX/bin)
    bin.install libexec / "venv/bin/viv"
    bin.install "scripts/setup-docker-compose.sh" => "viv-setup-docker-compose"
    bin.install "scripts/configure-cli-for-docker-compose.sh" => "viv-configure-cli-for-docker-compose"
    
    # # Set permissions if necessary
    # chmod 0755, bin/"viv-setup-docker-compose"
    # chmod 0755, bin/"viv-configure-cli-for-docker-compose"
    
    # Copy everything except certain directories
    prefix.install Dir["*"]
    prefix.install Dir[".*"].select { |f| File.file?(f) }

    # Clean up unnecessary directories
    rm_rf ".devcontainer"
    rm_rf ".github"
    rm_rf ".vscode"
    rm_rf "cli" # This is installed in the virtualenv
    rm_rf "ignore"

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
