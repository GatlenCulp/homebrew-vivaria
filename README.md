# homebrew-vivaria

**WARNING: This is currently a pre-production Forumla that has not been thoroughly tested and which installs a currently non-official version of Vivaria**

![Homebrew Tests](https://github.com/gatlenculp/homebrew-vivaria/actions/workflows/tests.yml/badge.svg)

![./assets/metr_logo.svg](./assets/metr_logo.svg)
![./assets/logo.png](./assets/logo.png)

[Vivaria](https://vivaria.metr.org/) is METR's tool for running evaluations and conducting agent elicitation research. This package contains a web app which is used for running and organzing evaluations as well as a command line interface to aid in the development of tasks. More information can be found on the website [here](https://vivaria.metr.org/).

For testing purposes and creating installation helper scripts, Gatlen has created [his own fork of Vivaria](https://github.com/GatlenCulp/vivaria/) which this installs. See the original [here](https://github.com/METR/vivaria)

## 00 TOC

- [homebrew-vivaria](#homebrew-vivaria)
  - [00 TOC](#00-toc)
  - [01 Setup](#01-setup)
    - [01.01 Installation](#0101-installation)
    - [01.02 Web UI](#0102-web-ui)
    - [01.03 Starting and Testing a Task via the CLI](#0103-starting-and-testing-a-task-via-the-cli)
    - [01.04 Evaluating an Agent on a Task using the CLI and Web UI](#0104-evaluating-an-agent-on-a-task-using-the-cli-and-web-ui)
    - [01.05 Shutting down](#0105-shutting-down)
    - [01.06 Examples for Testing](#0106-examples-for-testing)
  - [02 Uninstalling](#02-uninstalling)
  - [03 Updating](#03-updating)
  - [04 Known Issues](#04-known-issues)
  - [05 Developing and Maintaining this Formula](#05-developing-and-maintaining-this-formula)
    - [05.01 The Source](#0501-the-source)
    - [05.02 The Python Dependencies](#0502-the-python-dependencies)
    - [05.03 Copying Everything Over](#0503-copying-everything-over)
    - [05.04 Debugging](#0504-debugging)
    - [05.05 Random Useful Notes](#0505-random-useful-notes)
    - [05.06 Roadmap](#0506-roadmap)
  - [06 Contact the Maintainer](#06-contact-the-maintainer)

---
## 01 Setup

### 01.01 Installation

1. Tap this repository
```bash
brew tap GatlenCulp/vivaria
```

2. Install Vivaria
```bash
brew install vivaria
```

3. (If the brew postinstall failed) Run the post-installation setup (This will ask you for a valid [OpenAI API Key](https://medium.com/@lorenzozar/how-to-get-your-own-openai-api-key-f4d44e60c327)).
*Be cautious running this command multiple times as it will overwrite your current configuration and will require you to follow all the instructions from here onward*
```bash
viv setup
```

4. (If the brew postinstall failed) Open docker
```bash
open -a Docker
```

5. (If the brew postinstall failed) Build and run the server images (This may take a while)
```bash
viv docker compose up --detach --wait
```

### 01.02 Web UI

6. Test that the server is up
```bash
docker compose ps  # You should see a list of containers
curl http://localhost:4001/health  # You should see a JSON response {...TODO...}
```

7. Open the Vivaria web interface at https://localhost:4000/ and continue past the "insecure connection" warning.

8. The website will prompt you for your `ACCESS_TOKEN` and `ID_TOKEN` from `.env.server`.
![./assets/token-prompt.png](./assets/token-prompt.png)
You can get these by running
```bash
cat "$(brew --prefix vivaria)/vivaria/.env.server" | grep -E "ACCESS_TOKEN=|ID_TOKEN="
```

you should then have access to the web interface. The landing page should look like this:

TODO: INSERT IMAGE

### 01.03 Starting and Testing a Task via the CLI

9. You can start your first task environment by loading up the example task "abandon" from the "reverse_hash" task family:
```bash
viv task start reverse_hash/abandon $(brew --prefix vivaria)/vivaria/task-standard/examples/reverse_hash
```

10. Now that the task is running you should be able to see it by running:
```bash
viv task list
```

11.  Enter the task environment container by running:
```bash
viv task enter --user agent
```

12.  Look at the instructions in `/home/agent/`:
```bash
pwd
cat instructions.txt
```
You should see something like:
> Please find the word whose SHA-256 hash is as follows: 98sdfs923432jsdsdf
> Return only the word as your answer.

13.  Write up a `submission.txt` document. The solution to this task is "abandon":
```bash
echo "abandon" > submission.txt
```

14.   Exit the container:
```bash
exit
```

15.   Check your score from the `submission.txt` document or check other solutions:
```bash
viv task score  # You should see something like "1" TODO
viv task score --submission "wrong answer"  # You should see something like "0" TODO
```

16.  Stop the task:
```bash
viv task kill
```

### 01.04 Evaluating an Agent on a Task using the CLI and Web UI

17. Unfortunately, Vivaria does not come included with an example agent, but we can add one easily to our installation directory. We will add the public [modular agent](https://github.com/poking-agents/modular-public), developed by METR:
```bash
mkdir -p "$(brew --prefix vivaria)/agents"
git clone https://github.com/poking-agents/modular-public \
  "$(brew --prefix vivaria)/agents/modular-public"
```

18. We will now run this agent on the same `reverse_hash/abandon` task we did above.
```bash
viv run reverse_hash/abandon \
  --task-family-path $(brew --prefix vivaria)/vivaria/task-standard/examples/reverse_hash \
  --agent-path $(brew --prefix vivaria)/agents/modular-public
```

19. The last command prints a link to [https://localhost:4000/path/to/run](https://localhost:4000/...) Follow that link to see the run's trace and track the agent's progress on the task. The run page should update as the agent takes actions live. It should look something like this:

![./assets/run-page.png](./assets/run-page.png)

20. Play with the interface a bit to get an understanding of the tool
21. Head back to the homepage at [https://localhost:4000/](https://localhost:4000/) and check out the runs page, and run the default query. This is where you can view the summaries of your ran tasks. It should look a bit like this (with less items):

![./assets/runs-page.png](./assets/runs-page.png)

22. You can then kill the task (or jump into the task environment and poke around.)
```bash
viv task kill
```

### 01.05 Shutting down

23. To shut down the server, you just need to stop the images

```bash
viv docker compose down
```

24. And confirm there are no more active images

```bash
docker compose ps
```

### 01.06 Examples for Testing

25. Located in `$(brew --prefix vivaria)/vivaria/task-standard/examples` are a variety of example tasks you can examine, run, and test to understand how to create your own tasks

```bash
ls $(brew --prefix vivaria)/vivaria/task-standard/examples
```
> agentbench              crypto                  gaia                    gpu_inference           humaneval               machine_learning_local  reverse_hash            vm_test
count_odds              days_since              gpqa_diamond            hello_world             local_research          pico_ctf                swe_bench

---
## 02 Uninstalling

To uninstall, run `brew uninstall vivaria`. This will not delete your `~/.config/viv-cli/` directory. That must be removed manually.

---
## 03 Updating

To update Vivaria to the latest version:

1. Update the Homebrew formulae:
   ```bash
   brew update
   ```

2. Upgrade Vivaria:
   ```bash
   brew upgrade vivaria
   ```

3. Restart the Docker containers:
   ```bash
   docker compose down
   viv docker compose up --detach --wait
   ```

4. Check that the server is running with the new version:
   ```bash
   curl http://localhost:4001/health
   ```

5. Clear your browser cache and refresh the Vivaria web interface.

Note: If you encounter any issues after upgrading, you may need to remove the old Docker images and rebuild:
```bash
viv docker compose down --rmi all
viv docker compose up --detach --wait --build
```
---
## 04 Known Issues

**ISSUE: Install failed due to docker**
```text
Error: An exception occurred within a child process:
  RuntimeError: /opt/homebrew/opt/docker not present or broken
Please reinstall docker. Sorry :(
```
This may be fixed by running `brew link docker` and trying the installation again.


---
## 05 Developing and Maintaining this Formula

### 05.01 The Source

Brew downloads your source and places it in a temporary build directory. This source is commonly pulled in two different ways.

**tar.gz compressed file**

GitHub generates these with each release/prerelease when you add a new tag. Add the url and the checksum to the brew install. To get the checksum you can run a command like the one below.

```bash
curl -L https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
```
$\rightarrow$ `2ad566ffd8836670dd5a5639b8f30efbbedf0fb76d250315aae9b38085188042`

**GitHub Repository Clone**
To use this, you simply link to the repository, include a tag, and the revision which you can get with running something like this in the vivaria repository locally:
```bash
git rev-parse v0.1.3
```
$\rightarrow$ `d67cc7894064e45f3459104c0f004fc1bd86612b`

**Why git is used instead**
Vivaria requires the `.git` repository files and GitHub does not include those in their `tar.gz` packages, so we have opted to use the git clone method.

```ruby
class Vivaria < Formula
  desc "Task environment setup tool for AI research"
  homepage "https://vivaria.metr.org/"
  # ...
  # Stable release
  url "https://github.com/GatlenCulp/vivaria.git",
      # Use git to include .git which is needed for the CLI
      using:    :git,
      tag:      "v0.1.3",
      revision: "d67cc7894064e45f3459104c0f004fc1bd86612b"
end
```

### 05.02 The Python Dependencies

Brew has a light policy to not allow you to use the internet during the installation process, which is a problem for pip installing the packages necessary for Vivaria. Luckily, Brew has a decent interface for managing Python packages and setting up a virtual environment. More information can be found here: [https://docs.brew.sh/Python-for-Formula-Authors](https://docs.brew.sh/Python-for-Formula-Authors).

Python packages are added as [resources](https://rubydoc.brew.sh/Formula#resource-class_method) within the formula, linking directly to their `.tar.gz` package. Luckily, you don't need to track down all the needed packages by hand and can instead add them directly to your formula from the [`vivaria/cli/pyproject.toml`](https://github.com/GatlenCulp/vivaria/tree/main/cli) with `brew update-python-resources vivaria`.

```ruby
class Vivaria < Formula
  include Language::Python::Virtualenv
  desc "Task environment setup tool for AI research"
  homepage "https://vivaria.metr.org/"
  # ...
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
  # ...
end
```

These packages are then installed by brew into the the final install path (ex: `/opt/homebrew/Cellar/vivaria/0.1.0`) and placed in the `libexec/venv` directory (`libexec` is for dependent executables not invoked directly by the installing user). The viv cli is also installed as a package into the virtual environment.

```ruby
class Vivaria < Formula
  include Language::Python::Virtualenv
  desc "Task environment setup tool for AI research"
  homepage "https://vivaria.metr.org/"
    # ...
  def install
      # Install dependencies and the CLI in a virtualenv
    venv = virtualenv_create(libexec/"venv", "python3.11")
    venv.pip_install resources
    venv.pip_install buildpath/"cli"
      # ...
  end
end
```

In making the virtual environment and building the package which will automatically make an executable called `viv` in the virtual environment's bin. We then copy this executable to `final_install_path/bin` which contain executables which are symlinked to Brew's bin (ex: `/opt/homebrew/bin/`) which is on the user's path, making the `viv` script available to the user anywhere.

### 05.03 Copying Everything Over

At this point, the viv-cli is essentially installed, but since the web ui relies on typescript and docker files, we need to maintain a large chunk of the original project files in `final_install_path`. In the rest of the script, we install all the docs into the folder brew expects to find them (`final_install_path/share/doc`), delete everything we no longer need, and copy the rest over from the build path to the final install path under `vivaria`.

```ruby
class Vivaria < Formula
  desc "Task environment setup tool for AI research"
  homepage "https://vivaria.metr.org/"
  # ...
  def install
    # ...
    # Install documentation
    doc.install Dir["docs/*"]
    doc.install "README.md"
    doc.install "LICENSE"
    doc.install "CONTRIBUTING.md"

    # Clean up unnecessary directories
    rm_rf ".devcontainer"
    rm_rf ".github"
    rm_rf ".vscode"
    rm_rf "cli"
    rm_rf "docs"
    rm_rf "ignore"

    # Copy remaining files to vivaria directory
    src_dir = prefix/"vivaria"
    src_dir.mkpath
    dot_files = [".", ".."]
    src_dir.install Dir["*", ".*"].reject { |f| dot_files.include?(File.basename(f)) }
    # ...
  end
end
```

### 05.04 Debugging

To install the formula with debug mode and receive more verbose errors during developing the formula, you can run:
`brew install --formula --debug --verbose ./Formula/vivaria.rb`

Similarly for uninstalling:
`brew uninstall --debug --verbose vivaria`

I was attempting to set up a Ruby debugger w/ intellisense in VSCode but it wasn't working:
`gem install ruby-lsp`
`gem install debug`

### 05.05 Random Useful Notes

`echo $(brew --prefix vivaria)` can be used to get the [opt-prefix](https://docs.brew.sh/Manpage) for Vivaria. This returns a static path to a symlinked folder pointing to the most recent version of vivaria.

The [Homebrew Ruby API documentation](https://rubydoc.brew.sh/Formula#homepage%3D-class_method) is very helpful as well as the the [higher-level Homebrew documentation](https://docs.brew.sh/).

A good man-page has yet to be written and may not ever be written but I decided to draft a simple incomplete one with a warning. This may possibly lead to more confusion, but I've decided to do it anyways for the experience and to see if it may be helpful to continue developing.

If you need to make any edits to the viv cli without editing the repo and reinstalling entirely, I recommend cloning the Vivaria repo, setting up a venv with required packages `mkdir ~/.venvs && python3 -m venv ~/.venvs/viv && source ~/.venvs/viv/bin/activate` then running `pip install -e cli` in the Vivaria project root. If you run `which viv` you should see you are not using the one in homebrew and are instead using the `viv` from your repo. Any updates to the cli will be live as you make them and commands should work normally.

Caveats are info displayed after installation.

To check whether your formula fits brew's formula style you can run `brew audit --eval-all --formula --strict --online vivaria`

Ex:
```bash
brew audit --eval-all --formula --strict --online vivaria

gatlenculp/vivaria/vivaria
  * line 8, col 3: `url` (line 8) should be put before `license` (line 5)
  * line 19, col 3: dependency "python@3.11" (line 19) should be put before dependency "rust" (line 21)
  * line 107, col 1: Trailing whitespace detected.
  * line 127, col 5: Avoid rescuing the `Exception` class. Perhaps you meant to rescue `StandardError`?
  * line 130, col 8: Trailing whitespace detected.
  * line 131, col 1: Trailing whitespace detected.
  * line 133, col 5: Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`.
  * line 134, col 5: Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`.
  * line 135, col 5: Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`.
  * line 136, col 5: Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`.
  * line 137, col 5: Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`.
  * line 138, col 5: Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`.
  * line 139, col 1: Trailing whitespace detected.
  * line 143, col 49: Avoid immutable Array literals in loops. It is better to extract it into a local variable or a constant.
  * line 143, col 50: Prefer double-quoted strings unless you need single quotes to avoid extra backslashes for escaping.
  * line 143, col 55: Prefer double-quoted strings unless you need single quotes to avoid extra backslashes for escaping.
  * line 148, col 1: Trailing whitespace detected.
  * line 167, col 1: Extra blank line detected.
  * line 169, col 3: Expected 1 empty line between method definitions; found 2.
  * line 190, col 1: Trailing whitespace detected.
  * line 195, col 1: Trailing whitespace detected.
  * line 198, col 1: Trailing whitespace detected.
Error: 22 problems in 1 formula detected.
```

The style fixer is also helpful:
```bash
brew style --fix gatlenculp/vivaria
```

As well as all other tests included in the `.github/workflows/` files.

### 05.06 Roadmap

- [ ] Automatically configure an SSH key for the user to use with viv.
```ruby
# Not working, need to adjust
# Set up SSH keys
ssh_key_path = etc/"vivaria/id_rsa"
system "ssh-keygen", "-t", "rsa", "-b", "4096", "-f", ssh_key_path, "-N", ""
chmod 0600, ssh_key_path
chmod 0644, "#{ssh_key_path}.pub"

# Append SSH public key path to .env
File.open(prefix/".env", "a") { |f| f.puts "SSH_PUBLIC_KEY_PATH=#{ssh_key_path}.pub" }
system "viv", "register-ssh-public-key", "#{ssh_key_path}.pub"
```
- [ ] Fix having to do `brew link docker` for each install. (Possibly only on my computer)
- [ ] Run viv setup automatically
- [ ] Make viv setup
- [ ] Look into docker buildx as a way of building the docker images

## 06 Contact the Maintainer

Gatlen Culp, METR Contractor
Email: gatlen.culp@metr.org
Portfolio: [gatlen.notion.site](https://gatlen.notion.site)
