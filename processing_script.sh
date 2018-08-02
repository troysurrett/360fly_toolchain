mkdir equirectangular
for i in `ls ./*.MP4`
do
  echo "ffmpeg -i $i -i ~/git_repos/equirectangular-remap/fly360_x.pgm -i ~/git_repos/equirectangular-remap/fly360_y.pgm -lavfi remap ./equirectangular/$i"
done
