jekyll build
rm _site.tar.gz
tar -czvf _site.tar.gz _site
ssh $USER@marcinbiegun.com "rm ~/_site.tar.gz"
scp _site.tar.gz $USER@marcinbiegun.com:~
ssh $USER@marcinbiegun.com "rm -rf ~/_marcinbiegun.com; tar -xvzf _site.tar.gz; mv _site _marcinbiegun.com"
ssh $USER@marcinbiegun.com "rm -rf ~/marcinbiegun.com; mv _marcinbiegun.com marcinbiegun.com"
ssh $USER@marcinbiegun.com "rm ~/_site.tar.gz"
