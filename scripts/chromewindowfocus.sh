PROFILE_INPUT="$1/Default/Web Data"
PROFILE=$(readlink -f "$PROFILE_INPUT")

PRESENT=$(sqlite3 "$PROFILE" 'select short_name from keywords;' | grep 'focus window')

if [ -z "$PRESENT" ]; then
  sqlite3 "$PROFILE" "insert into keywords (short_name, keyword, url, favicon_url) values ('focus window', 'j', 'javascript:', '');"
  echo 'Added focus window keyword'
  exit 0
fi;

echo 'No action needed'
exit 0
