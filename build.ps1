$dest_dir = './public'
$dest_dir = Join-Path $dest_dir 'conference' 
New-Item -Type dir $dest_dir -Force
Copy-Item -Path './conference/types.yml' -Destination (Join-Path $dest_dir 'types.yml') -Force
$all_yml = Get-Content './conference/*/*.yml' -Encoding UTF8
Set-Content -Path (Join-Path $dest_dir 'allconf.yml') $all_yml -Encoding UTF8 -Force

$last_updated = Get-ChildItem -Path(Join-Path $dest_dir 'allconf.yml') | select LastWriteTimeUtc
Set-Content -Path (Join-Path $dest_dir 'last_updated.json') $last_updated.LastWriteTimeUtc -Encoding UTF8 -Force

Write-Host $running_mode