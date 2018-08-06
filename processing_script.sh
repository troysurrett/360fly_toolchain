mkdir equirectangular
for i in `ls ./*.MP4`
do
  ffmpeg -i $i -c:v mpeg4 -i ~/git_repos/equirectangular-remap/fly360_x.pgm -i ~/git_repos/equirectangular-remap/fly360_y.pgm -lavfi remap ./equirectangular/$i
done
cd equirectangular
mkdir ready_for_davinci
for i in `ls ./*.MP4`
do
  ffmpeg -y -i $i -c:v mpeg4 -force_key_frames "expr:gte(t,n_forced*1)" -b:v 250000k -r 29.97 -f mp4 ./ready_for_davinci/$i
done
cd ready_for_davinci
mkdir blindspotted
for i in `ls ./*.MP4`
do
    # 190 * 2 = 380; 1440 + 190 = 1540; 
  # ffmpeg -y -i $i -vf "pad=width=2880:height=1540:y=380,crop=w=2880:h=1440:y=190"  -f mp4 ./blindspotted/$i
  #THIS IS CLOSER: you have to do some scaling. Just padding and cropping cuts out some sky, every time.
  #ffmpeg -y -i ./FLY00101.mp4 -vf "pad=width=2880:height=4000:y=300:x=0,crop=w=2880:h=2000:y=150,scale=w=2880:h=1440" -f mp4 ./blindspotted/FLY00101_spotted_scaled.MP4
  ffmpeg -y -i $i -vf "pad=width=4000:height=2000:y=0:x=-1,scale=h=1440,crop=w=2880:x=560" -f mp4 ./blindspotted/$i
done
