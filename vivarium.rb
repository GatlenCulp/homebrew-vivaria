class Vivaria < Formula
    desc "Vivaria task environment setup tool"
    homepage "https://vivaria.metr.org/"
    url "https://github.com/Form-And-Function/vivaria", :using => :git, :branch => "main", :depth => 1
    # url "https://github.com/METR/vivaria.git", branch: "main"
    # version "0.1.0"
    license "MIT"
  
    depends_on "docker"
    depends_on "docker-compose"
    depends_on "python@3.9"
  
    def install
      # Install Python dependencies
      system "pip3", "install", "-e", "cli"
  
      # Copy necessary scripts and files
      bin.install "scripts/setup-docker-compose.sh"
      bin.install "scripts/configure-cli-for-docker-compose.sh"
      prefix.install "docker-compose.yml"
      prefix.install ".env.server"
      prefix.install ".env.db"
  
      # Create a wrapper script for setup
      (bin/"vivaria-setup").write <<~EOS
        #!/bin/bash
        set -e
  
        # Run setup scripts
        #{bin}/setup-docker-compose.sh
        #{bin}/configure-cli-for-docker-compose.sh
  
        # Start Docker Compose
        docker-compose -f #{prefix}/docker-compose.yml up --detach --wait
  
        echo "Vivaria setup complete. Visit https://localhost:4000 to access the UI."
      EOS
  
      chmod 0755, bin/"vivaria-setup"
    end
  
    def caveats
      <<~EOS
        To complete setup, run:
          vivaria-setup
  
        Then, add your OpenAI API key to #{prefix}/.env.server:
          echo "OPENAI_API_KEY=your_key_here" >> #{prefix}/.env.server
  
        For task environments with aux VMs, also add AWS credentials to #{prefix}/.env.server.
      EOS
    end
  
    test do
      system "#{bin}/vivaria-setup", "--help"
    end
  end
  