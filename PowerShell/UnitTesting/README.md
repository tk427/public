# UnitTesting
Scripts for validating other scripts

A random collection of scripts that generate objects that can be used to validate the functionality of other scripts.

This Repo includes:
* Change-LastWriteTime.ps1
  * Changes Last Write Time of File to allow testing of scripts where you need to identify files by Last Write Time.
* CreateIncrimentalFilesSizes.ps1
  * Creates a progression of files with linearly increasing file sizes.
* CreateRandomSizeFiles.ps1
  * Creates a progression of files were the sizes are more organic.  This is done by repeated get-childitems and writing the results to
  a text file.
