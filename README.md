# ABOUT GPG-HEP
GPG encryption/decryption shell scripts that come with a unified terminal launcher. Capable of processing both text and media (image/video files). Additionally includes an automated metadata stripping process with EXIFTOOL. 

The goal of GPG-HEP is to bring a quasi-ui to already existing systems in order to create a streamlined workflow. GPG-HEP was designed with the intention of bringing powerful privacy and security tools into the hands of the average person. Because of this choice, files and folders are named discreetly and the repository will remain as lightweight as possible. This is ideally deployable in volatile situations where privacy and security are necessary.

- GPG tools for encrypting/decrypting with GPG supported algorithms; IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH, CAMELLIA128, CAMELLIA192, CAMELLIA256
- Uses a shared master key file system for double symmetric encryption
- Automated processes for encrypting and decrypting text and media (image/video files)
- Metadata stripping provided by EXIFTOOL and incorporated in media file workflows
- Scripts "shred" (fill with random bytes) files before removing them to obfuscate data and prevent recovery
- Extensive error checking to prevent accidental overwrites, deletion, or data leaking

# INSTALLATION
- Clone this repository with the following command:
  ```
  cd ~ ; git clone https://github.com/Unchain6787/gpg-hep.git
  ```
# QUICK GUIDE:
### 1. Start the launcher with gpg-hep.sh
  - In your file manager go to "Edit > Preferences > Behavior > Executable Text Files" select "Ask each time"
    > This step will vary depening on your Linux distribution and file manager
  - Double click the gpg-hep.sh file in the cloned directory and select "Run in Terminal"
  - This is the recommended method of launching (to ensure working directories are correct)
  - Alternatively you can enter the following command to start the launcher:
    ```
    cd ~/gpg-hep ; ./gpg-hep.sh
    ```
### 2. Install prerequisite packages
  - GPG-HEP has four package dependencies; GPG, EXIFTOOL, PULSEAUDIO, LOLCAT
  - These can be installed manually, or you can type "p" in the launcher to run the automated installer
    > PULSEAUDIO and LOLCAT are not required for full functionality as they are only providing sound and color
    > A future "light" version of GPG-HEP will be available without these dependencies
  - Alternatively you can start preresquisite installation with the following command:
    ```
    cd ~/gpg-hep/scripts ; ./prereq.sh
    ```
### 3. Create a shared key file
  - A key file contains 250 random characters used as the passphrase to encrypt/decrypt files
  - This key file should be encrypted with a strong shared passphrase
  - You must coordinate this shared passphrase with the recipient
  - Start creating a key file by typing "k" in the launcher
  - Alternatively you can start key generation with the following command:
    ```
    cd ~/gpg-hep/scripts ; ./kgen.sh
    ```
### 4. Encrypt text
  - Before encrypting text you must have a .gpg key file in the "gpg-hep/files" directory
  - Because text editing is limited in most terminals, you may wish to use a text editor to compose your message and then paste it into the terminal with "Control + Shift + V"
  - Begin text encryption by typing "te" in the launcher and following the prompts
  - Alternatively you can start text encryption with the following command:
    ```
    cd ~/gpg-hep/scripts ; ./te.sh
    ```
### 5. Decrypt text
  - Before decrypting be sure to have your .gpg message and .gpg key file in the "gpg-hep/files" directory
  - Be ready to enter the coordinated shared passphrase for the key file, which was established with the sender
  - Beging text decryption by typing "td" in the launcher and following the prompts
  - Alternatively you can start text decryption with the following command:
    ```
    cd ~/gpg-hep/scripts ; ./td.sh
    ```
### 6. Encrypt a media file

### 7. Decrypt a media file

### 8. Strip media file metadata

# SECURITY TIPS
  - When coordinating your shared key file passhprase with the recipient, physical communication is always best
  - The key file should always be transferred separately from files
  - You should never store the key with associated files unless processing them

# FEEDBACK
I am looking for help to extend the functionality of GPG-HEP and revise workflows. If you would like to become involved with this project or offer your revisions/suggestions, please contact me through the repository page. You are free to fork this repository, provided that you do so under the GPL-3.0 license.
