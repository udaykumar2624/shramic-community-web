# Contributing Guide

Thank you for contributing to the Shramic Community Website project.

## Branch Strategy

- main → Production branch (Live site)
- dev → Development branch
- feature/feature-name → New features
- fix/bug-name → Bug fixes

## Workflow

1. Pull latest changes from dev
   git checkout dev
   git pull origin dev

2. Create a feature branch
   git checkout -b feature/your-feature-name

3. Make changes and commit
   git add .
   git commit -m "feat: added homepage hero section"

4. Push branch
   git push origin feature/your-feature-name

5. Create Pull Request → dev branch

## Commit Message Format

- feat: for new feature
- fix: for bug fix
- docs: for documentation
- refactor: for code improvement
- style: for UI/style changes

Example:
feat: added contact form validation

## Rules

- Do not push directly to main
- Always create PR to dev
- Get at least one approval before merging
