#!/usr/bin/env bash
set -Eeu

# Pull changes for the superprojects's branch.
git pull

changes="$(git status --short --ignore-submodules=all)"

# Test for existance of files to stage.
if [ -z "${changes}" ]; then
    exit 0
fi

echo ">>> Type the commit message, followed by [ENTER]:"
read -r commit_message

# Stage and commit superprojects's files except for submodule folders.
find . -depth 1 -a \( -type f -o -name '_*' \) -exec git add {} \;
git commit -m "$commit_message"


#####################
## Unused snippets ##
#####################

# Generate and iterate over an array of submodule names.
#submodule_list_string="$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')"
#IFS=' ' read -ra submodule_list_array <<< "${submodule_list_string}"

#for submodule_name in "${submodule_list_array[@]}"; do
#    submodule_declared_branch="$(cd .. && git config -f .gitmodules submodule.${submodule_name}.branch)"
#    submodule_actual_branch="$(cd ${submodule_name} && git symbolic-ref --short HEAD)"
#
#    # Test for a branch name match.
#    if [ "${submodule_declared_branch}" != "${submodule_actual_branch}" ]; then
#        continue
#    fi
#
#    git add "${submodule_name}"
#done

# Unnamed
#file_list_string="$(ls -A | grep --invert-match '^\.git$')"
#if [ -d "./${file_name}" ] && [ -z "$(echo ${file_name} | grep '^_')" ]; then
#    continue
#fi
