############################################################
##########  MAKEFILE FOR PYTHON-PROJECT-TEMPLATE  ##########
############################################################

#####################################
## Set PROJECT_PATH AND SHELL_PROFILE
#####################################
PROJECT_PATH=${PWD}
SHELL_PROFILE=${SHELL_PROFILE_PATH}

#######
## Init
#######
ifdef SHELL_PROFILE_PATH
init: poetry
	@echo "\033[0;35m####################\033[0m"
	@echo "\033[0;35m##  POETRY-SHELL  ##\033[0m"
	@echo "\033[0;35m####################\033[0m"
	@echo "Running shell..."
	@poetry shell
	@echo ""
else
init:
	@read -p "Your profile (.bashrc, .zshrc, .bash_profile, etc)?: " PROFILE; \
	echo "export SHELL_PROFILE_PATH='${HOME}/$$PROFILE'" >> ~/$$PROFILE; \
	echo "\033[0;33mSource your profile\033[0m";
endif

#########
## Commit
#########
commit: pre-commit-all
	@echo "\033[0;35m##################\033[0m"
	@echo "\033[0;35m##  GIT COMMIT  ##\033[0m"
	@echo "\033[0;35m##################\033[0m"
	@echo "Running commitizen CHANGELOG.md update..."
	@poetry run cz changelog
	@git add .
	@echo ""
	@echo "Running comitizen commit..."
	@poetry run pre-commit run
	@poetry run cz commit
	@echo ""

##############
## Poetry init
##############
poetry:
	@echo "\033[0;35m######################\033[0m"
	@echo "\033[0;35m##  POETRY INSTALL  ##\033[0m"
	@echo "\033[0;35m######################\033[0m"
	@echo "Installing dependencies in poetry environment..."
	@poetry install --no-root
	@echo ""
	@echo "\033[0;35m##########################\033[0m"
	@echo "\033[0;35m##  PRE-COMMIT INSTALL  ##\033[0m"
	@echo "\033[0;35m##########################\033[0m"
	@echo "Installing pre-commit..."
	@poetry run pre-commit install
	@echo ""

poetry-remove:
	@echo "\033[0;35m#####################\033[0m"
	@echo "\033[0;35m##  POETRY REMOVE  ##\033[0m"
	@echo "\033[0;35m#####################\033[0m"
	@echo "Removing poetry environment $(shell poetry env list | awk '{print $$1}')..."
	@poetry env remove $(shell poetry env list | awk '{print $$1}')
	@echo "Poetry environment removed."
	@echo ""
	@echo "Removing poetry.lock..."
	@rm poetry.lock
	@echo "Poetry lock removed."
	@echo ""

#############
## Pre-commit
#############
pre-commit:
	@echo "\033[0;35m##################\033[0m"
	@echo "\033[0;35m##  PRE-COMMIT  ##\033[0m"
	@echo "\033[0;35m##################\033[0m"
	@cd ${PROJECT_PATH}/
	@git add .
	@pre-commit run
	@echo ""

pre-commit-all:
	@echo "\033[0;35m######################\033[0m"
	@echo "\033[0;35m##  PRE-COMMIT-ALL  ##\033[0m"
	@echo "\033[0;35m######################\033[0m"
	@cd ${PROJECT_PATH}/
	@git add .
	@pre-commit run
	@poetry run pre-commit run --all-files trailing-whitespace
	@poetry run pre-commit run --all-files check-executables-have-shebangs
	@poetry run pre-commit run --all-files debug-statements
	@poetry run pre-commit run --all-files check-merge-conflict
	@poetry run pre-commit run --all-files name-tests-test
	@poetry run pre-commit run --all-files ruff
	@poetry run pre-commit run --all-files flake8
	@poetry run pre-commit run --all-files black
	@poetry run pre-commit run --all-files bandit
	@poetry run pre-commit run --all-files isort


#######
## Help
#######
help:
	@echo "#############################################################"
	@echo "##           MAKEFILE FOR PYTHON-PROJECT-TEMPLATE          ##"
	@echo "#############################################################"
	@echo ""
	@echo "   Targets:   "
	@echo ""
	@echo "   - init: Initialize repository:"
	@echo "     - Install poetry"
	@echo "     - Install pre-commit"
	@echo "       Usage: % make or % make init"
	@echo ""
	@echo "   - aliases: Create alias"
	@echo "       Usage: % make aliases"
	@echo ""
	@echo "   - change-version: Change version"
	@echo "       Usage: % make change-version version=<version_number>"
	@echo ""
	@echo "   - doc: Deploy documentation"
	@echo "       Usage: % make doc-deploy → GitHub Page"
	@echo "       Usage: % make doc-deploy version=<version_number> → GitHub Page"
	@echo "       Usage: % make doc-serve  → Local"
	@echo ""
	@echo "   - jup2md: Convert Jupyter notebook to Markdown"
	@echo "       Usage: % make jup2md → Convert notebooks/examples.md"
	@echo "       Usage: % make jup2md jupfile=</path/to/jupfile>"
	@echo "                            ↳ Convert notebooks/examples.md"
	@echo ""
	@echo "   - poetry-remove: Remove poetry environment."
	@echo "       Usage: % make poetry-remove"
	@echo ""
	@echo "   - pre-commit: Run pre-commits"
	@echo "       Usage: % make pre-commit"
	@echo ""
	@echo "   - profile: Run memory-profiler"
	@echo "       Usage: % make profile"
	@echo "       Usage: % make profile version=<version_number>"
	@echo ""
	@echo "   - test: Run pytests"
	@echo "       Usage: % make test"
	@echo ""
	@echo "   - stream: Run streamlit app"
	@echo "       Usage: % make stream"
	@echo ""
	@echo "   - help: Display this menu"
	@echo "       Usage: % make help"
	@echo ""
	@echo "   - default: init"
	@echo ""
	@echo "   Hidden targets:"
	@echo "   "
	@echo "   - poetry"
	@echo "   "
	@echo "#############################################################"
