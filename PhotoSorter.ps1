# This script sorts both .nef (raw) photos and .jpg photos from a source folder and into a destination folder. 
# It works by importing a .csv with the full names of the files (without filetypes) that should be kept.
# For example:
# 
# name
# DSC_4020
# DSC_4028
# DSC_4039
# 
# And so forth

# Set to the source path for the photos
$sourcePath = "" 

# Set the destination path for the kept photos
$destinationPath = "" 

# Set to the path with the .csv with the file names to keep.
$keptFileNames = Import-Csv ""

Set-Location $sourcePath

foreach ($file in $keptFileNames) {
    $fileName = $file.name  # Assuming the CSV has a column named 'Name'
    
    # Move .jpg files
    $jpgFile = Get-ChildItem -Path $sourcePath -Filter "$fileName.jpg" -ErrorAction SilentlyContinue
    if ($jpgFile) {
        Move-Item -Path $jpgFile.FullName -Destination $destinationPath
        Write-Host "$fileName.jpg has been moved" -ForegroundColor Green
    } else {
        Write-Host "$fileName.jpg not found" -ForegroundColor Red
    }
    
    # Move .nef files
    $nefFile = Get-ChildItem -Path $sourcePath -Filter "$fileName.nef" -ErrorAction SilentlyContinue
    if ($nefFile) {
       Move-Item -Path $nefFile.FullName -Destination $destinationPath
        Write-Host "$fileName.nef has been moved" -ForegroundColor Yellow
    } else {
        Write-Host "$fileName.nef not found" -ForegroundColor Red
    }
}
