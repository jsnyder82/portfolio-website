#!/bin/bash

echo "🔍 Checking Git status..."
if [[ -n $(git status --porcelain) ]]; then
  echo "⚠️ You have uncommitted changes."
  git status

  read -p "📝 Enter a commit message to save changes: " commit_msg

  git add .
  git commit -m "$commit_msg"
else
  echo "✅ No uncommitted changes."
fi

echo "🔄 Pulling latest changes from GitHub..."
git pull origin main --rebase

echo "🔄 Rendering site..."
quarto render

echo "📦 Pushing changes to GitHub..."
git push origin main

echo "🚀 Publishing site to GitHub Pages..."
quarto publish gh-pages
