# powershell -ExecutionPolicy Bypass -File .\folder_name.ps1

$replacements = @{
    'Deloitte' = 'del_oitt_e'
    'GAAL' = 'G_A_A_L'
    'Omnia' = 'Om_ni_a'
    'Levvia' = 'Le_v_via'
    'Engagement' = 'Eng_age_ment'
    'Client' = 'Clie_nt'
    'Salary' = 'Sal_ary'
    'Payroll' = 'Pay_roll'
    'JE' = 'J_E'
    'Journal entry' = 'J_E'
}

 

function Rename-FilesRecursively {
    param (
        [string]$path
    )
    Get-ChildItem -Path $path -Recurse | ForEach-Object {
        if ($_.PSIsContainer) {
            Rename-FilesRecursively -path $_.FullName
        } else {
            $newName = $_.Name
            foreach ($key in $replacements.Keys) {
                $newName = $newName -ireplace $key, $replacements[$key]
            }
            if ($newName -ne $_.Name) {
                Rename-Item $_.FullName -NewName $newName
            }
        }
    }
}

 

Rename-FilesRecursively -path "."