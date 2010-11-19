#
# Deployment script for TrendView prototype.
#
# Requires your SSH public key to be set to webdeploy
#
echo "Removing old files."
ssh webdeploy@67.207.140.55 rm /usr/local/juicewww/demos/nfl/*.*

echo "Copying bin-debug"
scp -r ../bin-debug/* webdeploy@67.207.140.55:/usr/local/juicewww/demos/nfl/
open http://media.juiceanalytics.com/demos/nfl/Main.html