#!/bin/bash

# Automated deploy script for Quarto portfolio site

echo "🔄 Rendering site..."
quarto render

echo "✅ Site rendered."

echo "📦 Adding files to Git..."
git add .

echo "✍️ Enter a commit message: "
read commit_msg

git commit -m "$commit_msg"
git push origin main

echo "🚀 Publishing to GitHub Pages..."
quarto publish gh-pages

echo "🌐 Done! Check your live site at:"
echo "https://jsnyder82.github.io/portfolio-website/"
