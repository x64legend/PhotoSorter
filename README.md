<#
 * Project Name : Photo Sorter
 * File Name    : PhotoSorter.ps1
 * Author       : Sydnie Barnes
 * Created Date : 2025-11-07
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