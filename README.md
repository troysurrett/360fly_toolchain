# 360fly_toolchain
Use FFMPEG to Automate Equirectangular Conversion of 360Fly Video Clips

## Motivation
My laptop is perhaps not amazing, and for whatever reason, 360Fly Director only wants to convert short videos. Long ones simply do not work. Luckily, the camera has a 4 minute video chaptering feature. Sadly, Director does not have any batch processing features. If it takes 8 minutes to convert a 4 minute video and I shoot 1 hour and 20 minutes of video, I have 2 hours and 40 minutes of sitting in front of the computer mostly waiting and occasionally pushing a couple buttons. This is extremely boring and I would like to go to bed!

Thanks to https://github.com/prouast/equirectangular-remap I was inspired to develop a command-line solution based on FFMPEG. This is the result.

## Instructions
Copy your camera's footage into a folder. Open your Mac or Linux terminal and cd to that directory. Run 3840x1920/processing_script.sh. Consume the output in footage_folder/equirectangular/ready_for_davinci/ in your favourite editing suite. I use Davinci Resolve. Consider deleting all the videos in footage_folder/equirectangular when you're done.

I dislike that there is an intermediate step, but when I tried doing it all in one step, the output was black and white.

## Caveats and TODO's
There are lots. Firstly, I am not responsible for your use of this script. If you lose your footage, that's your business. Don't complain to me, etc.

The blindspot size was found via trial and error. I do not have good math for it, nor did I do an especially precise job of measuring the one that 360Fly Director inserts.

I did not develop a map and a script for all the resolutions that 360Fly Director has. I only need the big one.

There are random, rambling notes in here that I made to preserve my sanity while I figured this out. I know nothing about video processing.

I believe the bitrate setting (`-b:v 250000k`) is way too high and inflating the filesize of the output unnecessarily. At some point I'll get around to figuring out what the right number is.
