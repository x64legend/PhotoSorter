<#
 * Project Name : Photo Sorter
 * File Name    : PhotoSorter.ps1
 * Author       : Sydnie Barnes
 * Created Date : 2024-10-06
 * Last Updated : 2025-12-01
 * Version      : v1.1.0
 * Description  : This script sorts both .nef (raw) photos and .jpg photos from a source folder and into a destination folder.
 *                It operates on the assumption that the files have a shared prefix $prefix and sequential number filenames.
 *                Simply type the numbers of the file names and it will append the prefix and move the files to a destination.
 *                E.g. Type 5069 to retreive DSC_5069.jpg and DSC_5069.nef.
 * Dependencies : N/A
 * Notes        : [2025-12-01] Adjusted from a csv input to array input loop for ease of just keeping things in 1 program.
 *                Also converted to a function for ease of use.
#>

# Define function
function Move-Photos {
    param (
        [Parameter(Mandatory = $true)]
        [string]$SourceDirectory,

        [Parameter(Mandatory = $true)]
        [string]$DestinationDirectory,

        [Parameter(Mandatory = $true)]
        [string]$FileNamePrefix,

        [string[]]$Files
    )

    # Store kept file names
    $keptFileNames = @()

    # Filename prefix - change if applicable. 
    $prefix = $FileNamePrefix

    # Change location to source path
    Set-Location $SourceDirectory

    # Add files if they were defined, otherwise ask for them. 
    if ($Files) {
        $keptFileNames = $Files
    }
    else {
        do {
            # Enter files to keep, press 'q' to quit
            $fileToKeep = Read-Host "Enter the number to add to kept items array or press 'q' to quit"
            if ($fileToKeep -ne "q") {
                $keptFileNames += $fileToKeep
                Write-Host "Added $fileToKeep to kept items."
                Write-Host "Current Kept items -`n$keptFileNames"
            }
        } until ($fileToKeep -eq "q")

    }

    # Move files
    Write-Host "Moving files...`n" -ForegroundColor Yellow
    foreach ($fileNumber in $keptFileNames) {
        $fileName = $prefix + $fileNumber

        # Get all files matching the file name and move them
        $matches = Get-ChildItem -Path $SourceDirectory -Filter "*$fileName*" -ErrorAction SilentlyContinue

        if ($matches) {
            foreach ($match in $matches) {
                Move-Item -Path $match.FullName -Destination $DestinationDirectory
                Write-Host "$($match.Name) moved" -ForegroundColor Green
            }
        }
        else {
            Write-Host "$fileName not found" -ForegroundColor Red
        }

    }
    Write-Host "`nAll requested files moved from $SourceDirectory to $DestinationDirectory" -ForegroundColor Cyan
}

