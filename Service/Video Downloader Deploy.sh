# Global Variables
ServiceFolder="Video-Downloader" # Github Project Name
GithubLink="https://github.com/AnkanSaha/Video-Downloader.git"

# Import All Files
cd # Go to Home Directory

# Check if the Service Folder Exists
if [ -d "$ServiceFolder" ]; then
  # Delete the Service Folder
  sudo rm -rf "$ServiceFolder"
  echo "$ServiceFolder directory deleted."
fi

git clone $GithubLink # Clone the Repository

cd $ServiceFolder # Go to the Repository

# Install All Dependencies
npm install

# Install Environment Variables
read -p "Enter the LIVE URL: " LIVE_URL # Get the LIVE URL
read -p "Enter PORT Number: " PORT # Get the PORT Number
read -p "Enter RAPID API KEY: " RAPID_API_KEY # Get the RAPID API KEY
read -p "Enter YT MUSIC URL: " YT_MUSIC_URL # Get the YT MUSIC URL
read -p "Enter YT VIDEO URL: " YT_VIDEO_URL # Get the YT VIDEO URL

# Create .env File
touch .env # Create .env File
echo "CORSALLOWEDURL=$LIVE_URL" >> .env # Add LIVE_URL to .env File
echo "PORT=$PORT" >> .env # Add PORT to .env File
echo "RAPIDAPIKEY=$RAPID_API_KEY" >> .env # Add RAPID_API_KEY to .env File
echo "YTMUSICURL=$YT_MUSIC_URL" >> .env # Add YT_MUSIC_URL to .env File
echo "YTVIDEOURL=$YT_VIDEO_URL" >> .env # Add YT_MUSIC_URL to .env File

# Permission to env file
sudo chmod -w .env # Remove Write Permission from .env file

# Start the Server
npm start # Start the Server

#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
