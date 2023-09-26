$logFilePath = ".\encryptionLog.txt"

 

function Encrypt-String {
    param (
        [string]$inputString,
        [string]$key
    )

 

    $keyBytes = [System.Text.Encoding]::UTF8.GetBytes($key)
    $hashKey = (New-Object System.Security.Cryptography.SHA256CryptoServiceProvider).ComputeHash($keyBytes)
    $aes = New-Object System.Security.Cryptography.AesCryptoServiceProvider
    $aes.Key = $hashKey
    $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
    $aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
    $encryptor = $aes.CreateEncryptor()
    $inputBytes = [System.Text.Encoding]::UTF8.GetBytes($inputString)
    $encryptedBytes = $encryptor.TransformFinalBlock($inputBytes, 0, $inputBytes.Length)
    $aes.Dispose()
    return [Convert]::ToBase64String($encryptedBytes) -replace '[/+=]', ''
}

 

function Decrypt-String {
    param (
        [string]$inputString,
        [string]$key
    )

 

    $keyBytes = [System.Text.Encoding]::UTF8.GetBytes($key)
    $hashKey = (New-Object System.Security.Cryptography.SHA256CryptoServiceProvider).ComputeHash($keyBytes)
    $aes = New-Object System.Security.Cryptography.AesCryptoServiceProvider
    $aes.Key = $hashKey
    $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
    $aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
    $decryptor = $aes.CreateDecryptor()
    $inputBytes = [Convert]::FromBase64String($inputString)
    $decryptedBytes = $decryptor.TransformFinalBlock($inputBytes, 0, $inputBytes.Length)
    $aes.Dispose()
    return [System.Text.Encoding]::UTF8.GetString($decryptedBytes)
}

 

function Log-Encryption {
    param (
        [string]$originalName,
        [string]$encryptedName
    )

 

    Add-Content -Path $global:logFilePath -Value "$originalName,$encryptedName"
}

 

function Log-Decryption {
    param (
        [string]$encryptedName
    )

 

    $content = Get-Content -Path $global:logFilePath
    $newContent = $content | Where-Object { $_ -notmatch "^$encryptedName," }
    Set-Content -Path $global:logFilePath -Value $newContent
}

 

function Is-AlreadyEncrypted {
    param (
        [string]$originalName
    )

 

    if (Test-Path -Path $global:logFilePath) {
        $content = Get-Content -Path $global:logFilePath
        return $content -match "^$originalName,"
    }
    return $false
}

 

function Rename-FilesRecursively {
    param (
        [string]$path,
        [string]$key,
        [switch]$decrypt
    )

 

    Get-ChildItem -Path $path -Recurse | ForEach-Object {
        if ($_.PSIsContainer) {
            Rename-FilesRecursively -path $_.FullName -key $key -decrypt:$decrypt
        } else {
            try {
                $newName = if ($decrypt) {
                    $decryptedName = Decrypt-String -inputString $_.BaseName -key $key
                    Log-Decryption -encryptedName $_.BaseName
                    $decryptedName
                } else {
                    if (Is-AlreadyEncrypted -originalName $_.BaseName) {
                        Write-Host "$($_.BaseName) is already encrypted. Skipping..." -ForegroundColor Yellow
                        return
                    }
                    $encryptedName = Encrypt-String -inputString $_.BaseName -key $key
                    Log-Encryption -originalName $_.BaseName -encryptedName $encryptedName
                    $encryptedName
                }
                Rename-Item $_.FullName -NewName ("$newName$($_.Extension)") -ErrorAction Stop
            } catch {
                Write-Host "Failed to rename $($_.FullName) due to: $($_.Exception.Message)" -ForegroundColor Red
            }
        }
    }
}

 

# Ensure the log file exists
if (-not (Test-Path -Path $logFilePath)) {
    New-Item -Path $logFilePath -ItemType File
}

 

$key = "YourSecretPassword1234"  # Use a secure password
Rename-FilesRecursively -path "." -key $key  # To Encrypt Filenames
# Rename-FilesRecursively -path "." -key $key -decrypt  # To Decrypt Filenames