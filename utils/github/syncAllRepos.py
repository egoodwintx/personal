#
# syncAllRepos.py
# author : Ed Goodwin
# date : 06.04.2023
#

import os
import requests

# GitHub credentials
USERNAME = os.environ.get('GITHUB_USERNAME')
ACCESS_TOKEN = os.environ.get('GITHUB_ACCESS_TOKEN')

# Path to your local repositories
REPO_PATH = '/path/to/your/repositories'

# Function to refresh a repository
def refresh_repository(repo):
    url = f'https://api.github.com/repos/{USERNAME}/{repo}/dispatches'
    headers = {
        'Authorization': f'token {ACCESS_TOKEN}',
        'Accept': 'application/vnd.github.everest-preview+json'
    }
    payload = {
        'event_type': 'manual_dispatch'
    }
    response = requests.post(url, headers=headers, json=payload)
    if response.status_code == 204:
        print(f'Refreshed repository: {repo}')
    else:
        print(f'Failed to refresh repository: {repo}')
        print(f'Response: {response.json()}')

# Get a list of all repositories in the specified path
repos = [repo for repo in os.listdir(REPO_PATH) if os.path.isdir(os.path.join(REPO_PATH, repo))]

# Refresh each repository
for repo in repos:
    refresh_repository(repo)
