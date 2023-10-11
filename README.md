# ABOUT GPG-HEP
GPG encryption/decryption shell scripts that come with a unified terminal launcher. Capable of processing both text and media (image/video files). Additionally includes an automated metadata stripping process with EXIFTOOL. 

Nothing in this project does anything you can not do on your own. The goal of GPG-HEP was simply to bring a quasi-ui to already existing systems in order to create a streamlined workflow. GPG-HEP was designed with the intention of bringing powerful privacy and security tools into the hands of the average person. Because of this choice, files and folders are named discreetly and the repository will remain as lightweight as possible. This is ideally deployable in volatile situations where privacy and security are necessary.

- GPG tools for encrypting/decrypting with all GPG supported algorithms; IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH, CAMELLIA128, CAMELLIA192, CAMELLIA256
- Uses a shared master key file system for double symmetric encryption
- Automated processes for encrypting and decrypting text and media (image/video files)
- Metadata stripping provided by EXIFTOOL and fully incorporated in media file workflows
- Scripts "shred" (fill with random bytes) files before removing them to obfuscate data and prevent recovery
- Extensive error checking to prevent accidental overwrites, deletion, or data leaking
- No personal or identifying data is stored in the files created or edited by these scripts

# INSTALLATION
- Clone this repository with the following command:
  > cd ~ ; git clone https://github.com/Unchain6787/gpg-hep.git
- Double click "gpg-hep.sh" and select "Run in Terminal"

# QUICK GUIDE:
### 1. Start the launcher with gpg-hep.sh
  - Double click the gpg-hep.sh file in the cloned directory and select "Run in Terminal"
  - This is the recommended method of launching scripts (to ensure working directories are correct)
  - Alternatively you can enter the following command to start the launcher:
    > cd ~/gpg-hep ; ./gpg-hep.sh

### 2. Install prerequisite packages
  - GPG-HEP has four package dependencies; GPG, EXIFTOOL, PULSEAUDIO, LOLCAT
  - These can be installed manually, or you can type "p" in the launcher to run the automated installer
    > PULSEAUDIO and LOLCAT are not required for full functionality as they are only providing sound and color.
    > A future "light" version of GPG-HEP will be available without these dependencies.

### 3. Create a key to share with the recipient of your files
  - This process can be started by typing "k" in the launcher or running the following command:
    > cd ~/gpg-hep/scripts ; ./kgen.sh 
  - This key file will be encrypted with a strong shared passphrase
  - You must coordinate this shared passphrase with the recipient in some way, physical delivery is ideal
  - A key file contains 250 random characters which will be used to encrypt/decrypt your files
  - The key file should always be transferred separately from files
  - You should never store the key with associated files unless processing them

### 4. Encrypt some text

### 5. Decrypt some text

### 6. Encrypt a media file

### 7. Decrypt a media file

### 8. Strip media file metadata

# FEEDBACK
I am looking for help to extend the functionality of GPG-HEP and revise workflows. If you would like to become involved with this project or offer your revisions/suggestions, please contact me through the repository page. You are free to fork this repository, provided that you do so under the GPL-3.0 license.
