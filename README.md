# ABOUT GPG-HEP
GPG encryption/decryption shell scripts that come with a unified terminal launcher. Capable of processing both text and media (image/video files). Additionally includes an automated metadata stripping process with EXIFTOOL. 

The goal of GPG-HEP is to bring a quasi-ui to already existing systems in order to create a streamlined workflow. GPG-HEP was designed with the intention of bringing powerful privacy and security tools into the hands of the average person. Because of this choice, files and folders are named discreetly and the repository will remain as lightweight as possible. This is ideally deployable in volatile situations where privacy and security are necessary.

- GPG tools for encrypting/decrypting with GPG supported algorithms; IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH, CAMELLIA128, CAMELLIA192, CAMELLIA256
- Uses a shared master key file system for double symmetric encryption
- Automated processes for encrypting and decrypting text and media (image/video files)
- Metadata stripping provided by EXIFTOOL and incorporated in media file workflows
- Scripts "shred" (fill with random bytes) files before removing them to obfuscate data and prevent recovery
- Extensive error checking to prevent accidental overwrites, deletion, or data leaking

## INSTALLATION
### Clone this repository with the following command:
```
cd ~ ; git clone https://github.com/Unchain6787/gpg-hep.git
```
## QUICK GUIDE:
### Start the launcher with gpg-hep.sh
- Enable text/script file execution in your file manager
   > This step will vary depening on your Linux distribution and file manager
- Execute the gpg-hep.sh file in the cloned directory
   > You will be prompted to install prerequisite packages when starting the launcher (GPG and EXIFTOOL)
### Create a shared key file
- Create a key file by typing "k" in the launcher
   > A key file contains 250 random characters used as the passphrase to encrypt/decrypt files

   > This key file should be encrypted with a strong shared passphrase

   > You must coordinate this shared passphrase with the recipient
### Encrypt text
- Begin text encryption by typing "te" in the launcher and following the prompts
   > Before encrypting text you must have a .gpg key file in the "gpg-hep/files" directory

   > Be ready to enter the coordinated shared passphrase for the key file which was established with the recipient

   > Because text editing is limited in most terminals, you may wish to use a text editor to compose your message and then paste it into the terminal with "Control + Shift + V"
### Decrypt text
- Begin text decryption by typing "td" in the launcher and following the prompts
   > Before decrypting be sure to have your .gpg message and .gpg key file in the "gpg-hep/files" directory

   > Be ready to enter the coordinated shared passphrase for the key file which was established with the sender
### Encrypt a media file
- Begin media encryption by typing "me" in the launcher and following the prompts
   > Before encrypting media, be sure to have your files and a .gpg key in the "gpg-hep/files" directory

   > Be ready to enter the coordinated shared passphrase for the key file which was established with the recipient

   > The media encryption script will ask if you want to strip metadata and do it for you
### Decrypt a media file
- Begin media decryption by typing "md" in the launcher and following the prompts
   > Before decrypting media, be sure to have your .gpg files and a .gpg key in the "gpg-hep/files" directory

   > Be ready to enter the coordinated shared passphrase for the key file which was established with the sender
### Strip media file metadata
- Strip metadata by typing "sm" in the launcher and following the prompts
   > Before stripping metadata from a media file, make sure it is placed in the "gpg-hep/files" directory
# SECURITY TIPS
- When coordinating your shared key file passhprase with the recipient, physical communication is always best
- The key file should always be transferred separately from files
- You should never store the key with associated files unless processing them

# FEEDBACK
I am looking for help to extend the functionality of GPG-HEP and revise workflows. If you would like to become involved with this project or offer your revisions/suggestions, please contact me through the repository page. You are free to fork this repository, provided that you do so under the GPL-2.0 license.
