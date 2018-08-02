mkdir equirectangular
for i in `ls ./*.MP4`
do
  ffmpeg -i $i -i ~/git_repos/equirectangular-remap/fly360_x.pgm -i ~/git_repos/equirectangular-remap/fly360_y.pgm -lavfi remap ./equirectangular/$i
done
cd equirectangular
mkdir ready_for_davinci
for i in `ls ./*.MP4`
  ffmpeg -y -i $i -c:v mpeg4 -force_key_frames "expr:gte(t,n_forced*1)" -r ntsc-film -b:v 250000k -c:a pcm_s16le ./ready_for_davinci/$i
do
