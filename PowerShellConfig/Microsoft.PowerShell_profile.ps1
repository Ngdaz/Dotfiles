# Start Oh My Posh CLI helper with my theme enabled
oh-my-posh init pwsh --config ~/.config/ohmyposh/whoisryosuke-v1.omp.json | Invoke-Expression

# Add icons to `ls` and `dir` file lists
# Don't have it? Install using this command:
# Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

# Add auto complete (requires PSReadline 2.2.0-beta1+ prerelease)
# Don't have it? Install using this command:
# Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows