# 📸 Photo Sorter

**File Name:** `PhotoSorter.ps1`  
**Author:** Sydnie Barnes  
**Created Date:** 2024-10-06
**Last Updated:** 2025-12-01  
**Version:** v1.1.0  

---

## 📝 Description
This script sorts both **.nef (raw)** photos and **.jpg** photos from a source folder into a destination folder.  
It operates on the assumption that the files have a shared prefix (`$prefix`) and sequential number filenames.  

Simply type the numbers of the file names, and the script will append the prefix and move the files to the destination.  

**Example:**  
Typing `5069` retrieves:
- `DSC_5069.jpg`  
- `DSC_5069.nef`  

---

## ⚙️ Dependencies
- N/A

---

## 📌 Notes
- **[2025-12-01]** Adjusted from a CSV input to an array input loop for simplicity.  
- Converted to a function for ease of use.