mkdir equirectangular
for i in `ls ./*.MP4`
do
  ffmpeg -i $i -i ~/git_repos/equirectangular-remap/fly360_x.pgm -i ~/git_repos/equirectangular-remap/fly360_y.pgm -lavfi remap -b:v 250000k ./equirectangular/$i
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
  ffmpeg -y -i $i -vf "pad=width=4000:height=2000:y=0:x=-1,scale=h=1440,crop=w=2880:x=560" -b:v 250000k -f mp4  ./blindspotted/$i
done
