# 進捗マップを作り直す: map.json を template.html に埋め込んで index.html にする
$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$json = Get-Content (Join-Path $dir 'map.json') -Raw -Encoding utf8
$null = $json | ConvertFrom-Json   # JSON が壊れていたらここで止まる
$html = (Get-Content (Join-Path $dir 'template.html') -Raw -Encoding utf8).Replace('__MAP_JSON__', $json.Trim())
Set-Content (Join-Path $dir 'index.html') $html -Encoding utf8 -NoNewline
"index.html を作りました"
