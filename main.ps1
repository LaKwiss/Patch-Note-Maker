function Get-GithubDocument {
    $name = Read-Host "What's the name of your file"

    [string]$url = "https://api.github.com/repos/LaKwiss/Patch-Note-Maker/contents/$name"
    $base64 = Invoke-RestMethod -Uri $url -Method Get | Select-Object -Property content
    
    $final = [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($base64.content))

    return $final
    
}
Get-GithubDocument
