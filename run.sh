input_folder=""
extension=""
backup_folder=""
backup_archive_name=""

while [ -n "$1" ]
do
case "$1" in
--input_folder)
input_folder="$2";;
--extension)
extension="$2";;
--backup_folder)
backup_folder="$2";;
--backup_archive_name)
backup_archive_name="$2";;
esac
shift
shift
done

mkdir -p "$backup_folder"

for file in $(find "$input_folder" -name "*.$extension")
do
cp "$file" "$backup_folder/${file//\//_}"
done

tar -zcf "$backup_archive_name" "$backup_folder"

echo "done"
