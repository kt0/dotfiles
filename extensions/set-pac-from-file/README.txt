Simple extension to set a PAC script from a file.

(1) Go to chrome://extensions/ and select "Developer mode".
(2) Click Load unpacked
(3) Select this directory

The Chrome settings will now use "my_pac_script.js". You can put your PAC script content directly in this file, or use a symlink to point to it.

Note that the PAC script will just be read once. If you make a change on disk to the PAC script click the reload button for the extension to make it re-read the file.

(Or could easily add polling to the extension)