BASENAME=$1

PREACHING_DIRECTORY=/nginx/processed/Preaching
FULL_SERVICE_DIRECTORY=/nginx/processed/Full\ Service
FULL_SERVICE_MP3_DIRECTORY=/nginx/processed/Full\ Service\ MP3

cd $PREACHING_DIRECTORY

# https://stackoverflow.com/questions/965053 - CLIPPING
# Clip $BASENAME. EXAMPLE: '200107PM.213853.mp4' becomes '200107PM'
DATE=${BASENAME%.*}
# https://unix.stackexchange.com/questions/283886 - REGEX
# Find the first file in the preaching folder that contains the basename date
# and remove the filename extension and date.
# EXAMPLE: '200107AM - Bro. Paul LaFontaine - Great sermon.mp4' becomes ' - Bro. Paul LaFontaine - Great sermon'
FILENAME="$DATE$(ls $DATE*.mp4 | head -1 | sed -e 's/^[0-9]*[A-Z]\{2\}//' -e 's/\.mp4$//')"

mv -n $FULL_SERVICE_DIRECTORY/$BASENAME.mp4 $FULL_SERVICE_DIRECTORY/$FILENAME.mp4;
mv -n $FULL_SERVICE_MP3_DIRECTORY/$BASENAME.mp3 $FULL_SERVICE_MP3_DIRECTORY/$FILENAME.mp3;

# one liners because why not?
# cd /nginx/processed/Preaching && mv -n /nginx/processed/Full\ Service/$basename.mp4 /nginx/processed/Full\ Service/"${filename%.*}$(ls ${filename%.*}*.mp4 | head -1 | sed -e 's/^[0-9]*[A-Z]\{2\}//' -e 's/\.mp4$//')".mp4;
# cd /nginx/processed/Preaching && mv -n /nginx/processed/Full\ Service\ MP3/$basename.mp3 /nginx/processed/Full\ Service\ MP3/"${filename%.*}$(ls ${filename%.*}*.mp4 | head -1 | sed -e 's/^[0-9]*[A-Z]\{2\}//' -e 's/\.mp4$//')".mp3;