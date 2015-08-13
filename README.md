# NorthEast-Mood-Analysis
A tool to predict the mood of the people, interests, key issues of the people of NorthEast India by scraping news from online magazines and auto parsing the content into major and minor issues over time.

Two R scripts have been written with the following functionalities.
1>  News_links_scraper -> This downloads all the relevant news links and stores them in an array named "links"
2>  Extract-articles  -> It loops through all the links provded in the array "links", accesses the date,heading and content of the article in the links and exports them to a csv file.

Currently only NortEastToday.in has been scraped, which has 52 articles. This needs to be extended to 4 or 5 newspapers  