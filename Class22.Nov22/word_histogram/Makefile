all: report.html
#need to update all and clean everytime you add a new line and you have a new output.
#We changed this from word.txt to histogram.tsv to histogram.png to report.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.html

words.txt:
	Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
#This will download the word file from that website
	
histogram.tsv: histogram.r words.txt
	Rscript $<
#this will run the histogram.R code that we made. $< means run the first thing in the list above which
#is histogram.r

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm -f Rplots.pdf
#Here we have just the rcode written in the make file as opposed to having its own r script
#The $@ means histogram.png
#Because we don't want the Rplots.pdf anymore, we add the rm line which removes Rplots


report.html: report.rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'
#This get's code from an rmarkdown file




