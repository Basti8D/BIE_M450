#!/bin/bash

cd "$(dirname "$0")" || exit 1

dotnet run --project src/BIE.Web --urls http://localhost:5080

