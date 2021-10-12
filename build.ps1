$dest_dir = './public'
$dest_dir = Join-Path $dest_dir 'conference' 
New-Item -Type dir $dest_dir -Force
Copy-Item -Path './conference/types.yml' -Destination (Join-Path $dest_dir 'types.yml') -Force
$all_yml = Get-Content './conference/*/*.yml' -Encoding UTF8
Set-Content -Path (Join-Path $dest_dir 'allconf.yml') $all_yml -Encoding UTF8 -Force
$updated_by = git config user.name
$updated_by = $updated_by.trim()
$last_updated = Get-ChildItem -Path(Join-Path $dest_dir 'allconf.yml') | select LastWriteTimeUtc
$content = "$($last_updated.LastWriteTimeUtc),$($updated_by)"
Set-Content -Path (Join-Path $dest_dir 'last_updated.json') $content -Encoding UTF8 -Force

Write-Host $content