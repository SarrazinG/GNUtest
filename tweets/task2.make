analyze : prep:
	echo " n ru " > results.txt
	cat book_tweets.tsv | cut -d \t -f4 | grep ru | wc -l >> results.txt
	echo "n august 2016" >> results.txt
	cat book_tweets.tsv | grep 'Oct 23' | grep 2012 | wc -l >> results.txt
	echo "n retweets" >> results.txt
	cat book_tweets.tsv | cut -d \t -f5 | grep '^RT' | wc -l >> result.txt
	echo "n game of thrones" >> results.txt
	cat book_tweets.tsv | grep '#gameofthrones' | wc -l >> results.txt

prep : download
	cat books_tweets100000.txt | jq '[.created_at,.user.id, .user.lang , .text] | @tsv' > book_tweets.tsv
	cat book_tweets.tsv | grep 'Oct 23' | grep 2012 > tweetsOct2012.tsv
	cat book_tweets.tsv | grep '#gameofthrones' > tweets_got.tsv

download :
	mkdir data
	cd data
	wget www.derekruths.com/static/reading_tweets/books_tweets100000.txt.gz into the data sub directory
	gunzip books_tweets100000.txt

