# This script sorts both .nef (raw) photos and .jpg photos from a source folder and into a destination folder. 
# It works by importing a .csv with the numbers of the filenames (without filetypes) that should be kept.
# For example:
# 
# Name
# 4020
# 4028
# 4039
# 
# And so forth

# Set to the source path for the photos
$sourcePath = "" 

# Set the destination path for the kept photos
$destinationPath = "" 

# Set to the path with the .csv with the file names to keep.
$keptFileNames = Import-Csv ""

# Filename prefix - change if applicable. 
$prefix = ""

Set-Location $sourcePath

foreach ($file in $keptFileNames) {
    $fileName = $prefix + $($file.Name)  # Assuming the CSV has a column named 'Name'
    
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
