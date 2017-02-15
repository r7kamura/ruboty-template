/app/vendor/mecab/libexec/mecab/mecab-dict-index -u original.dic -f utf-8 -t utf-8 dic.csv
mkdir -p /app/vendor/mecab/dic/
mv original.dic /app/vendor/mecab/dic/

echo "userdic = /app/vendor/mecab/dic/original.dic" >> /app/vendor/mecab/etc/mecabrc

bundle exec ruboty
