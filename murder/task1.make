task :
	touch README.txt
	wget https://raw.githubusercontent.com/fivethirtyeight/data/master/murder_2016/murder_2015_final.csv	
	head murder_2015_final.csv -n 1 > murder_header.csv
	tail murder_2015_final.csv -n 83 > murder_data.csv
	cat murder_data.csv | grep Illinois > murder_illinois.csv
	cat murder_data.csv | grep Maryland | wc -l > murder_maryland.count
	at murder_illinois.csv | cut -d , -f3,4 > murder_illinois_2014-2015.csv

