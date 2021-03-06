mkdir equirectangular
for i in `ls ./*.MP4`
do
  ffmpeg -i $i -i ~/git_repos/360fly_toolchain/3840x1920/fly360_3840x1920_x.pgm -i ~/git_repos/360fly_toolchain/3840x1920/fly360_3840x1920_y.pgm -lavfi remap -b:v 70000k ./equirectangular/$i
done

cd equirectangular
mkdir ready_for_davinci
for i in `ls ./*.MP4`
do
  ffmpeg -y -i $i -c:v mpeg4 -force_key_frames "expr:gte(t,n_forced*1)" -b:v 70000k -r 29.97 -f mp4 ./ready_for_davinci/$i
done

cd ready_for_davinci
mkdir blindspotted
for i in `ls ./*.MP4`
do
  ffmpeg -y -i $i -vf "pad=width=5334:height=2667:y=0:x=-1,scale=h=1920,crop=w=3840:x=747" -b:v 70000k -f mp4 ./blindspotted/$i
done

cd blindspotted
for i in `ls *.MP4`
do
  python ~/git_repos/spatial-media/spatialmedia -i $i injected_$i
done
