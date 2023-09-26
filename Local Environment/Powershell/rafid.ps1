# Symmetric encryption key - KEEP THIS SECRET!
$key = [Text.Encoding]::UTF8.GetBytes("1234567890123456")  # Example key, you should generate your own

# Encrypt string using AES
function Encrypt-String {
    param ([String]$plainText)

    $initVector = New-Object byte[] 16
    $r = [System.Security.Cryptography.RijndaelManaged]::Create()
    $encryptor = $r.CreateEncryptor($key, $initVector)
    $ms = New-Object System.IO.MemoryStream
    $cs = New-Object System.Security.Cryptography.CryptoStream $ms, $encryptor, "Write"
    $sw = New-Object System.IO.StreamWriter $cs
    $sw.Write($plainText)
    $sw.Close()
    [System.Convert]::ToBase64String($ms.ToArray())
}

function Rename-FilesRecursively {
    param (
        [string]$path
    )

    Get-ChildItem -Path $path -Recurse | ForEach-Object {
        if ($_.PSIsContainer) {
            Rename-FilesRecursively -path $_.FullName
        } else {
            $encryptedName = Encrypt-String $_.Name
            Rename-Item $_.FullName -NewName $encryptedName
        }
    }
}

# Prompt the user for the directory path
$directory = Read-Host -Prompt 'Enter the path to the directory you want to process'
Rename-FilesRecursively -path $directory
