# QualityOfLifeThings
Tools for easing headaches

TalendKeyGen will create an ssh key with the ecdsa algorithm, 256 bit to be used for connecting to github through Talend.  
it will also check for a config file in ~/.ssh, if it doesn't exist then it will create it and add your new key as an identity file.

It will put your pub key contents into your clipboard and open a browser to github/settings/keys.  

Select Add New Key, 
![image](https://user-images.githubusercontent.com/106775152/221200645-2fb623d9-7711-4b24-a658-13011c87c241.png)

give it a name and paste your clipboard contents into the big text box.
![image](https://user-images.githubusercontent.com/106775152/221200730-e3d48654-7024-4a39-9b1c-95cb0a2b49d7.png)
Now next to your new key, you'll see a dropdown that says "configure sso".  Select authorize for 'bayer-int'
![image](https://user-images.githubusercontent.com/106775152/221201066-4ba16bff-057f-42ce-8f99-ef187984e3d8.png)

To test your key, go back to your Terminal/Git Bash and run
ssh -T git@github.com

![image](https://user-images.githubusercontent.com/106775152/221201707-8e46c657-c1c5-4622-8809-1e4ea4d8bd70.png)

In the event of a Failure
![image](https://user-images.githubusercontent.com/106775152/221202159-cc30c3bf-8a17-4636-bc96-513c86d11545.png)

run the same command with -v
ssh -T git@github.com -v

This will run in verbose, it will tell you whether it's applying the key for Host * in your config file, if not then double check your config to make sure Host * has the IdentityFile line, and has your key that you created.

![image](https://user-images.githubusercontent.com/106775152/221202953-ae28de70-631c-48ac-9dd3-28e72da986d6.png)

