#!/bin/bash

# CampusNexus Verification Script
# Usage: ./VERIFY.sh

echo "🔍 Starting CampusNexus Technical Verification..."
echo "==============================================="

# 1. LocalNet Check
echo -n "1️⃣  Checking LocalNet Status... "
if algokit localnet status | grep -q "Running"; then
    echo "✅ Docker is UP"
else
    echo "❌ LocalNet is NOT running!"
    echo "   -> Run 'algokit localnet start' to fix."
fi

# 2. Bootstrap Check
echo -n "2️⃣  Verifying Dependencies (Bootstrap)... "
# We run this in dry-run or check mode if possible, or just run it to ensure everything is installed.
# 'algokit project bootstrap all' installs dependencies.
echo "Running 'algokit project bootstrap all'..."
algokit project bootstrap all
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed."
else
    echo "❌ Bootstrap failed."
fi

# 3. Build Check
echo -n "3️⃣  Verifying Build (Contracts & Frontend)... "
echo "Running 'algokit project run build'..."
algokit project run build
if [ $? -eq 0 ]; then
    echo "✅ Build SUCCESSFUL."
else
    echo "❌ Build FAILED."
fi

# 4. Env Audit
echo -n "4️⃣  Auditing Environment Variables... "
ENV_FILE="projects/frontend/.env"
if [ -f "$ENV_FILE" ]; then
    if grep -q "VITE_ALGOD_SERVER" "$ENV_FILE" && grep -q "VITE_PINATA_JWT" "$ENV_FILE"; then
        echo "✅ .env file compliant (Server & Pinata set)."
    else
        echo "⚠️  .env exists but missing VITE_ALGOD_SERVER or VITE_PINATA_JWT."
    fi
else
    echo "❌ projects/frontend/.env NOT FOUND."
fi

# 5. Git Audit
echo -n "5️⃣  Checking Git History... "
COMMIT_COUNT=$(git log --oneline | wc -l)
if [ "$COMMIT_COUNT" -gt 1 ]; then
    echo "✅ History verified ($COMMIT_COUNT commits found)."
else
    echo "⚠️  Git history too short (only $COMMIT_COUNT commit)."
fi

echo "==============================================="
echo "🎉 Verification Complete."
