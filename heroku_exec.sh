/app/vendor/mecab/libexec/mecab/mecab-dict-index -d /app/vendor/mecab/lib/mecab/dic/ipadic -u original.dic -f utf-8 -t utf-8 dic.csv
mv original.dic /app/vendor/mecab/lib/mecab/dic/ipadic/

echo "userdic = /app/vendor/mecab/lib/mecab/dic/ipadic/original.dic" >> /app/vendor/mecab/lib/mecab/dic/ipadic/dicrc

/app/vendor/bundle/ruby/2.4.0/bin/bundle exec ruboty
