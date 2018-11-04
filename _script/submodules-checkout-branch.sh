#!/usr/bin/env bash
set -Eeu

# Generate and iterate over an array of submodule names.
submodule_list_string="$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')"
IFS=$'\n' read -d '' -ra submodule_list_array <<< "${submodule_list_string}" || true

root_folder="${PWD}"

for submodule_name in "${submodule_list_array[@]}"; do
    cd "${submodule_name}"

    submodule_declared_branch="$(cd .. && git config -f .gitmodules submodule.${submodule_name}.branch)"
    submodule_actual_branch="$(git symbolic-ref --short HEAD)"

    # Test for a branch name match.
    if [ "${submodule_declared_branch}" = "${submodule_actual_branch}" ]; then
        continue
    fi

    git checkout "${submodule_declared_branch}"
    cd "${root_folder}"
done

#####################
## Unused snippets ##
#####################

#git submodule foreach 'git checkout $(git config -f ${toplevel}/.gitmodules submodule.${name}.branch || echo master)'
