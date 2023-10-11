# ABOUT GPG-HEP
Automated GPG encryption/decryption shell scripts that comes with a unified launcher.
- GPG encryption tools with implementation of all GPG supported algorithms; 
  (IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH, CAMELLIA128, CAMELLIA192, CAMELLIA256)
- Uses a shared master key file system to utilize doulbe symmetric encryption
- Automated processes for encrypting and decrpyting text and media (image/video files)
- Metadata stripping provided by EXIFTOOL and fully incorporated in media file workflows
- Scripts "shred" (fill with random bytes) files before removing them to obfuscate data and prevent recovery
- Extensive error checking to prevent accidental overwrites, deletion, or data leaking
- No personal or identifying data is stored in the files created or edited by these scripts

# INSTALLATION
- Press "Ctrl + H" to show hidden files (be sure to toggle this off when finished)
- Make this folder hidden by renaming it with a period prefix: 
  "gpg-hep" becomes ".gpg-hep"
- In your file browser menu bar go to:
  "Edit > Preferences > Behavior > Executable Text Files" select "Ask each time"
- Double click "start.sh" and select "Run in Terminal"
- If you are using the GNOME terminal, try the GPG-HEP profile with the command:
  "./scripts/install-profile.sh". 
  The GNOME profile is optional but offers a nice aesthetic and color coding

# QUICK GUIDE:
1 - If you are not comfortable with terminal commands, double click the start.sh file and select "run in terminal"
  - This is the recommended method of launching scripts (to ensure working directories are correct)
  - Alternatively you can enter the following command to start the launcher:
    > cd $HOME/gpg-hep ; ./gpg-hep.sh

2 - Create a key to share with the recipient of your files
  - This process can be started by typing "k" in the launcher or running the following command:
    > cd $HOME/gpg-hep/scripts ; ./kgen.sh 
  - This key file will be encrypted with a strong shared passphrase
  - You must coordinate this shared passphrase with the recipient in some way
    Physical delivery of the passphrase is obviously ideal
  - The key file contains 250 random characters which will be used to encrypt/decrypt your files
  - The key file should always be transfered seperately from files
  - They key file should never be stored with associated files unless processing them
