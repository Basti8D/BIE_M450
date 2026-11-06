#!/bin/bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

FILES=(
    "tests/BIE.UnitTests/LearnerUnitTests.cs.todo"
    "tests/BIE.IntegrationTests/LearnerIntegrationTests.cs.todo"
    "tests/BIE.E2ETests/LearnerE2ETests.cs.todo"
)

for relative in "${FILES[@]}"; do
    source="$ROOT/$relative"
    target="${source%.todo}"

    if [[ -e "$target" ]]; then
        echo "Bereits aktiv: $target"
        continue
    fi

    if [[ ! -e "$source" ]]; then
        echo "Aufgabendatei fehlt: $source" >&2
        exit 1
    fi

    mv -- "$source" "$target"
done

echo "Aufgaben aktiv. Die drei Platzhalter schlagen bis zur Bearbeitung fehl."
