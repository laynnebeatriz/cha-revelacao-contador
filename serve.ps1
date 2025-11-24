# Serve.ps1
# Inicia um servidor HTTP simples na porta 8000 usando Python (recomendado)
# Uso: abra PowerShell nesta pasta e execute `./serve.ps1`

$pwdPath = (Get-Location).Path
Write-Output "Iniciando servidor na pasta: $pwdPath"

# Verifica se python está disponível
$py = Get-Command python -ErrorAction SilentlyContinue
if ($py) {
    Write-Output "Usando Python para servir: python -m http.server 8000"
    python -m http.server 8000
} else {
    Write-Output "Python não encontrado. Abrindo servidor simples em PowerShell (porta 8000)."
    Add-Type -AssemblyName System.Net.HttpListener
    $listener = New-Object System.Net.HttpListener
    $prefix = "http://*:8000/"
    $listener.Prefixes.Add($prefix)
    $listener.Start()
    Write-Output "Servidor PowerShell rodando em http://localhost:8000 — pressione Ctrl+C para parar"
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $requestUrl = $context.Request.RawUrl.TrimStart('/')
        if ([string]::IsNullOrEmpty($requestUrl)) { $requestUrl = 'cha_revelacao.html' }
        $filePath = Join-Path $pwdPath $requestUrl
        if (Test-Path $filePath) {
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $context.Response.ContentLength64 = $bytes.Length
            $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
            $context.Response.OutputStream.Close()
        } else {
            $context.Response.StatusCode = 404
            $response = [System.Text.Encoding]::UTF8.GetBytes("Arquivo não encontrado")
            $context.Response.OutputStream.Write($response, 0, $response.Length)
            $context.Response.OutputStream.Close()
        }
    }
}
