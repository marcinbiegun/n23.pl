jekyll build
rm _site.tar.gz
tar -czvf _site.tar.gz _site
ssh $USER@n23.pl "rm ~/_site.tar.gz"
scp _site.tar.gz $USER@n23.pl:~
ssh $USER@n23.pl "rm -rf ~/_n23.pl; tar -xvzf _site.tar.gz; mv _site _n23.pl"
ssh $USER@n23.pl "rm -rf ~/n23.pl; mv _n23.pl n23.pl"
ssh $USER@n23.pl "rm ~/_site.tar.gz"
