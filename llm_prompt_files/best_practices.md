## 0 Unincorporated notes

1. Write tests even before you write the functions
2. Microservices!!!! Have every module within your code kind of accept a general dictionary?? As close as possible to the primitives at every level so you can plug-and-play your codes?
- Notes on the primatives → abstraction spectrum
    - Option A — Legit only json/dicts (prototypes and interoperability)
        - PROs
            - Very simple
            - Very interoperable/serializable
            - Easy to prototype
        - CONs
            - No type safety (but what about schema)
            - Poor documentation & semantics (but what about schema)
            - Bad performance (okay valid)
    - Option B — JSON + Schema / Typed Dicts (Optimal for most projects)
        - Still seems super compatible with other libraries. Perhaps the optimal version?
        - Hard to maintain
    - Option C — Only classes (I think perhaps never good???)
        - Poor serialization and can get convoluted

I see people reference this guys blog everywhere I go:
https://khalilstemmler.com/

1. Scripts = standalone executables(?)
2. Entry points = non-standalone executables(?)
3. Idk all these things are kinda just vibes…

## 1 Language-Specific

### Python-Specific

- **Pathlib > OS** — Use pathlib over OS wherever possible. It has much better syntax, error checking, and readability.
- **Docstrings** — Use sphinx docstrings with inline types

    ```python
    def my_function(param1: int, param2: str) -> bool:
        """
        Brief description of the function.

        :param int param1: Description of the first parameter.
        :param str param2: Description of the second parameter.
        :return: Description of the return value.
        :rtype: bool
        :test test_name /path/to/test.py: Description of test
        """
        return True
    ```

- **Jinja** — For long string templates, use Jinja
- **Pytest > unittest** — Use pytest exclusively, never ever use unittest (a common mistake is using unittest.patch instead of
- **Logging** — For logging, use the built-in logging module + the Rich handler. This shoul be the first thing to set up for any project.

    ![GatlenScreen_001178 [2024-08-14_07.49] (Code)@2x.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76c08362-e402-499e-b443-3bd2cf9c5779/819cdec1-cd79-4dff-82f6-a9b950ffd6a7/GatlenScreen_001178_2024-08-14_07.49_(Code)2x.png)

    ![GatlenScreen_001180 [2024-08-14_13.37] (Visual Studio Code)@2x.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76c08362-e402-499e-b443-3bd2cf9c5779/ddc590cc-a5eb-427c-aa1f-9d562725e1cb/GatlenScreen_001180_2024-08-14_13.37_(Visual_Studio_Code)2x.png)

- **Click** — Click is the best library for quickly bringing a function to be accessible via the command line. Never use argparse or anything like that, only ever use Click.
- **Flask** — To quickly bring functions to be accessible via HTTP, use Flask.
- **PyTorch > Tensorflow** — PyTorch has very pythonic language and is quickly becoming the go-to for machine learning although it is certainly not as efficient as Tensorflow as of yet.
    - Idk where pandas/numpy/others fit into this just yet
- (**poetry > requirements.txt?)**
- (pipx > pip?)
- (networkx for graphs?)
    - (pyvis for interactive graph visualization
- (plotly > matplotlib for interactive data visualization)
- Use Fstrings where possible and string.format if fstring not possible.
- Pydantic — Use pydantic CONSTANTLY. This is an absolutely phenomenal library for data validation, metadata, etc. This is combined with the standard typing library. This also allows for incredible serialization of objects as well into dictionaries with much ease. It’s best practice to feed in the config to a public function as a pydantic model

### Shell-Specific

- For the love of God, don’t use shell scripting if you don’t have to. Write wrappers around CLIs with python if needed.
- Not everything that is good practice for programming is good practice for scripting. Keep that in mind.
    - Functions should NEVER return any values. Only exit codes. It is a bitch to read info from these. (powershell actually good but we are stuck with bash atm)
    - Scripts can call other scripts if you want modularity. Not super recommended tho.
- Everything in the shell is MEANT to be quick and dirty (they literally name “list” “ls”). Make sure you are only using it for quick and dirty things.
- Learn the syntax ($…, ${…}, ${…:…}, $()),  (<, <<, |, >, >>), (‘ vs “), (&&, ||, ;)
- Learn about shells, subshells, environments, source vs direct execution
- Learn about stdin, stdout, stderr
- Install shell check

## 2 LLM-Specific

### General

- Do not spit out the entire script when one line is changed. Key changes. Yada yada.
- Script update instructions
Whenever you update a script that I have already written, you must:

Clearly indicate each line that was changed, removed, or added.
Provide a brief explanation for each change.
This should be done in the following format:

For changed lines:
```python
some_code_here  # <--- [CHANGED] Updated from `old_code_here` because <reason>
```
For removed lines:
```python
# some_removed_code_here  # <--- [REMOVED] because <reason>
```
For added lines:
```python
new_code_here  # <--- [NEW] Added because <reason>
```

Example:

Original Code:
```python
return EndpointCounter(endpoint_name='get_space', count=0)
```
Updated Code:

```python
await sync_to_async(counter.save)()  # <--- [NEW] Added because we need to save the counter to the database
return EndpointCounter(endpoint_name='get_space', count=1)  # <--- [CHANGED] Updated from `return EndpointCounter(endpoint_name='get_space', count=0)` because we want to start the count at 1 instead of 0
# removed unnecessary logging  # <--- [REMOVED] because it was redundant
```

    Always ensure the updates are minimal and focused on the necessary changes.
    Provide sufficient documentation and typing where appropriate.
    Maintain the integrity and original logic of the script as much as possible.


### Claude-Specific

- Use artifacts where applicable

## 3 General Programming

### Performance

- **Dynamic Programming** — Avoid recursion, instead use dynamic programming
    - **S**ubproblems definition
    - **R**elate subproblem solutions recursively
    - **T**opological order to argue relation is acyclic and subproblems form a DAG
    - **B**ase cases
    - **O**riginal problem
    - **T**ime analysis
- **Async** (Loops → Async) — Use async. Or at least note within loops that certain operations can be done asynchronously

```python
# Todo: Make example
```

- **Vectorization** — understand definitions more.

### Security

- Secrets manager > .env > hardcoding

### Modularity

- Modules should be extremely clear about
- USE FUNCTIONAL PROGRAMMING where possible. It leads to less side effects, greater parallelization/efficiency, greater interoperability, and easier debugging (In python: itertools, functools, and operators. Numpy functions. Etc.)
    - Pure functions — Deterministic and no-side effects (these should be marked in the docstring as PUREFUNC, all others assumed to be possible mutator functions)
    - No Iteration, only functions.
    - Do not change arguments or data that is passed in
        - (Note: one reason not to use functional programming might be for performance as making many copies might take up memory. To remedy this, instead functions that might benefit from mutation should have a parameter `mutate: bool = True` and have two routes — one that mutates the input and another that doesn’t. Functions with this setting should have the docstring marker of :OPTIONAL_PUREFUNC: and are gold standard)
    - The only function without a return type should be the main function or endpoint(?)

### Readability

- Avoid conditional branching like the plague, instead use return and break liberally, creating helper functions as needed.
- Avoid nesting wherever possible. The best code is typically only one nest of functions, and MAX two levels of nesting for loops if necessary
- Controversial: Use emojis frequently in comments, strings, logs, and print statements. In my opinion, these emojis act as little icons and register much faster in your mind than even one or two words do.
- Make heavy use of helper functions where possible. Two classes of helper function: private and public, and I have very different rules when it comes to using them.
    - Private helper functions are NEVER exported or used outside their defined scope. Most functions will be these.
    - Private helpers should be marked with a underscore at the front.
    - Private helper functions don't need exhaustive docstrings. A single line description without detailing parameters or anything is optimal for readability.
    - Public functions should be STANDALONE. No importing additional modules in scripts to use their functionality.
    - Public functions should be at the top of the module.
- Object Oriented Programming has the potential to be EXTREMELY convoluted and inheriting Classes should be used carefully and sparingly.
    - Follow SOLID principles(?)
    - AVOID INHERITANCE. This is the number one confusing part about OOP. However, non-inheriting classes can be very good practice for modeling. Instead of inheriting, consider just making an instance of the Class.
- For exports/imports/modules be VERY clear which things are meant to be used by other modules.
- Functions should generally have default
- If a string or something else abides by a particular format, it’s okay to add another Type even if only semantic. For example, when returning an HTML string, it might make more sense

```python
    def graph_to_html(graph: nx.DiGraph) -> HTML:
        if not graph:
            return HTML("<p>No graph data available.</p>")

        html_content = generate_nxgraph_preview(
            graph=graph,
            config=PreviewConfig(**config.model_dump())
        )
        return HTML(html_content)
```

### Error Handling

- …

### Data Validation

- Trust none of the data entering your functions. Always validate it before doing any processing to avoid weird errors when they are processed later on.
- Schema — If some piece of data is big enough or important enough to be saved as a file, it is big enough or important enough to have a bit of schema made for it. Wherever this data is being read into, it should be checked against the schema file rather than checked in-line code. This makes this data language independent as well.
    - json → json_schema
    - csv → ??? idk yet ???
    - …

### Comments & Documentation

- Always include a docstring at the top of a file/module describing the name and what it does.
- README organization
    - Include numbers with headings.

### Unittests

- For every function, module, and package, there should be a test written. (pytest if python)

### Philosophy

These are the rules of programming, in order of most to least important

1. KISS (Keep it simple stupid)
2. DRY (Do not repeat yourself)
3. Semantic (Keep variable names meaningful even if long.)

### Misc

- Use HTTP REST requests client code instead of proprietary software
- Do things as code wherever possible. This typically allows for a super robust ecosystem to become available to you, INCLUDING LLMs.
- Avoid magic values
- Logging
    - I like to use the following logging format:
    logging.basicConfig([level=logging.INFO](http://level=logging.info/), format='[%(asctime)s %(levelname)s %(filename)s:%(lineno)d] %(message)s')
- When printing out human-readable text, try to make it into a grid form.
    - Ex: instead of printing the message then the time it was ran, do it the other way around since the time’s length is generally

## 4 Version Control

- Submodules
- Branches
    - Main and Dev
- Tags

## 5 Containerization

- Use local environments
- Keep containers as light as possible
- Use layers to avoid long rebuilds

## 6 Project Structure

- Refer to project root universally as PROJECT_ROOT, shortened to PROJ typically and if this project has a name, it will be in all caps. No other directory will ever be in all caps. Ex: MANTISAPI/
- My general project layout

```markdown
# Gatlen Project Boilerplate
To copy whenever a new project is started for the sake of consistency and good practice.

## Clone with Cookie Cutter
This project uses cookiecutter (https://github.com/cookiecutter/cookiecutter)

```
project-boilerplate/
├── cookiecutter.json
└── {{cookiecutter.project_slug}}/
    ├── src/
    ├── tests/
    ├── docs/
    ├── .gitignore
    ├── README.md
    └── ... (other files and directories)
```

### Cookiecutter commands
- Install: `pip install cookiecutter`
- Local instantiation: `cookiecutter ./../project-boilerplate`
- Github instantiation: `cookiecutter https://github.com/GatlenCulp/project-boilerplate`
  - `--config-file /path/to/config/file.yaml` to add some defaults (or set `export COOKIECUTTER_CONFIG=/path/to/config/file.yaml`)
  - `--default-config` skip inputs, just use defaults in `cookiecutter.json`
  - `--output-dir <output-dir>`
  - [EXTRA CONTEXT] -- At the end you can also add `{var}={value}` to append additional context
    - Use `meta_created_time=$(date +"%Y-%m-%d %H:%M:%S")` to set the time of duplications

https://cookiecutter.readthedocs.io/en/1.7.2/advanced/index.html

I believe there MUST be a subfolder which is your root repo.

# Project layout

## 📁 `project-root (Private Development)`
These are all the files/directories which will only exist on your local machine

- 🔑 `project-root/secrets` -- Contains secrets, not to be pushed to the repo as raw text. Things like API keys, server URLS, and more. It's okay to have some boilerplate `.env-example` or `your-SSH-key-here.pem` file for the project though.
- 🔍 `project-root/logs` -- Saved logs for the project in the standardized name `[YEAR-MONTH-DAY 24HOUR:MINUTE:SECOND] PROCESS_NAME.log (IDK, EDIT LATER, ISO 8601 UTC format)`
- 🏔️ `project-root/venv` -- Contains external package dependencies installed for the project. Not committed to repo since they are large.

**PLUS All files in 📂 `project-root (Public Development)`**

## 📂 `project-root (Public Development)`
These are the files that anyone with access to the repo will be able to see (ie: files not in .gitignore)

TODO: Learn about Makefiles
TODO: Learn about OpenAPI (Good for microservices.)
TODO: Learn about poetry files for python development.

- 👀 `project-root/README.md`
- 🎁 `project-root/CONTRIBUTING.md`
- 🔨 `project-root/CHANGELOG.md` -- Using semantic versioning
- 🪪 `project-root/LICENSE` -- MIT License by default
- 🙈 `project-root/.gitignore`
---
- 🌊 `project-root/.github/workflows` -- This is where all the GitHub action workflows for CI/CD are to be stored. Optional.
  - TODO: Learn how git hooks work. And uhh other things with git.
- 🌳 `project-root/.git` -- Git verson tracking
- 🛠️ `project-root/.vscode` -- VSCode workspace settings to be shared among
- 📦 `project-root/dist` -- Executable builds of the project meant for distributing. Not applicable to all projects (ie: internal software) (not called build)
- 🐳 `project-root/docker` -- This is where all the Dockerfiles should be stored for the project.
- 📕 `project-root/docs` -- Any documentation beyond the `project-root/README.md` should exist here. This includes images and such.
- 📜 `project-root/scripts` -- Contains useful scripts for controlling many parts of project. Not necessary for functionality.
  - TODO: Perhaps add a load_config.sh?
- 🔐 `project-root/secrets.encrypted` -- Encrypted version of secrets. This is okay to push to the repo to make changes that should apply to everyone on the project. A password will be required to unencrypt these. Uncertain how it will be done yet. I'm aware this isn't very safe for public repositories, so if the repository is public, this should not be here.
  - TODO: Look into HashiCorp Vault
- 🏠 `project-root/src` -- Contains the MAIN body of code.
- 🧪 `project-root/tests` -- Unittests to confirm aspects of 🏠 `project-root/src` are working
  - TODO: Learn whether it is best practice to put these tests here. I guess it is common

## 🚀 `project-root (Containerized Launch Build)`

When building an image with **🐳 Docker** to deploy onto a server, these should be the only necessary directories to copy. (Descriptions not repeated)

TODO: Add these to `.dockerignore`

QUESTION: Are Docker containers meant to include debugging tools or should they just be easily launchable containers?

- 🔑 `project-root/secrets`
- ~~🏔️ `project-root/venv` (is it better just to install from scratch??? Probably.)~~
- 📜 `project-root/scripts` (Optional. These shouldn't be necessary for the build, but may be helpful)
- 🏠 `project-root/src`

## Automatically setting up git with best practices
- Create a main and dev branch with branch protections
- Create an initial git tag to mark pre-release with Semantic Versioning

## Best practices
- MICROSERVICES! ONE APP, ONE CONTAINER.
```

- I abide by the rule that you should be able to generally understand a project’s gist only by looking at the file structure. This is a much more lax rule than “one class one file” best practice.
- File names should be unique, that way they are searchable. There shouldn't be 1000 [main.py](http://main.py) files. If there is some module that requires you to have a bunch of [url.py](http://url.py) files, that is fine, but only if the reasoning behind it is well known and the relationship between files of the same name make sense.

### Separation of Concerns Architecture (MVP, DDD, etc.)

- It’s good to think about what kind of separation of concerns you like to use. Certain frameworks ask you to do this by default instead of giving you the flexibility (ex: Django with Model View Template). Sometimes it also comes up in infrastructure (Model/Data/Structure = Database, View/UI = Frontend, Controller/Logic = Backend) (might not be accurate
- I tend to follow a kind of a vague MVC logic just because that’s what I’m familiar with for the core of the application.

## 7 API

- HTTP (Remote, language-agnostic, portable)
- CLI (Local, language-agnostic, portable)
- Package (Local, language-internal, portable)
- Module (Local, language-internal, non-portable)
- Snippits/Functions/Blocks (Local, language-internal, non-portable)

## 8 CI/CD

- GitHub Actions — This is kind of my go-to since it is simple

## 9 Infrastructure

- AWS — I tend to use AWS for practically everything. I’m certified in AWS and their ecosystem is extremely mature, secure, and reliable. It is slightly expensive though, which is why I tend to rely on containerization to move my apps to other platforms if needed

## 10 Environment

- MacOS
- Brew
- Devcontainers?

## 11 IDE

- I used VSCode. There is an extremely rich ecosystem of extensions, themes, etc. It’s incredibly hackable and I enjoy
- Always always use the debugger for any development.

## 12 Languages

- Python — Kind of my go to. The ecosystem is very developed
- Javascript — God no. Please.
- HTML — Granted how universal HTML is for building user interfaces, this should be used basically anytime a user interface comes up. Not the most efficient, but very portable and hackable and such.
- Typescript + Node — I like TypeScript! Not super familiar but generally good.
- SASS > CSS
- Rust-curious but I’m worried the ecosystem isn’t quite there yet, I don’t doubt it’s Godly.

## 13 Project planning

1. Epics — Define your MVP and what should be included in different versions
2. Sprints — Define what will be worked on in the next week. Update progress frequently

```
          # SSH Keys
          MantisAPIv1key: ${{ secrets.MantisAPIv1key }}
          MantisAPI_EC2_DeployKey: ${{ secrets.MantisAPI_EC2_DeployKey }}
          MantisAPI_EC2_DeployKey_pub: ${{ secrets.MantisAPI_EC2_DeployKey_pub }}
        run: |
          ./scripts/populate_secrets.sh runwbat
```

## 14 Scripts in Things Other than BASH

[Thoughts on scripts, bash, and programming](https://www.notion.so/Thoughts-on-scripts-bash-and-programming-d931516070a44d4abd926b838c4ac8e5?pvs=21)

## 15 My Personal Weakpoints

For LLMs, please let me know if you find me doing any of these things.

- Overoptimization/overengineering
