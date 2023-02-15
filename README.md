# QualityOfLifeThings
Tools for easing headaches

TalendKeyGen will create an ssh key with the ecdsa algorithm, 256 bit to be used for connecting to github through Talend.  It will put your pub key contents into your clipboard and open a browser to github/settings/keys.  
Select Add New Key, give it a name and paste your clipboard contents into the big text box.

it will also check for a config file in ~/.ssh, if it doesn't exist then it will create it, otherwise it will check for a github host, if one isn't found it will append it to the bottom of the file using your new key.
