# -*- coding: utf-8 -*-
"""
Created on Wed Aug 19 23:14:52 2015

@author: rakeshreddy
"""

# import libraries
import os
os.chdir('C://Users//rakeshreddy//Desktop//Topic modeling//input')

import pandas as pd
import numpy as np

from collections import Counter

from LDA_code import perform_LDA

from twitter_custom import collect_twitter_data , perform_sentiment_analysis , get_the_mood

def strip_(x):
    return x.split()[0]

def take_input():
    data = pd.read_csv('NortheastToday.csv')
    Date_col = 2
    Article_col = 0
    Heading_col = 1
    Content_col = 3
    dates = data[data.columns[Date_col]]
    newdates = map(strip_ , dates)
    data['Month'] = newdates
    counterr = Counter(newdates)
    unique_months , idx = np.unique(newdates, return_index = True)
    idx = list(np.sort(list(idx)))
    months_unordered = list(np.array(newdates)[idx])
    datanew = pd.DataFrame()
    month_indices = [0]
    for i in range(len(months_unordered)) :
        if i == 0:
            datanew = data[data['Month'] == months_unordered[i]]
            month_indices.append(datanew.shape[0])
        else:
            datanew.append(data[data['Month']==months_unordered[i]] , ignore_index = True)
            month_indices.append(datanew.shape[0])
    return datanew , month_indices
    

if __name__ == '__main__' :
    csv_input , month_indices = take_input()
    Date_col = 2
    Article_col = 0
    Heading_col = 1
    Content_col = 3
    Month_col = 4
    for i in range(len(month_indices)-1):
        month_input = csv_input.ix[month_indices[i]:month_indices[i+1] , :]
        _issues , major_issue_no , minor_issue_no , top_words_collection = perform_LDA(month_input)
        twitter_data_for_the_month = collect_twitter_data(zip(_issues , top_words_collection))
        sentiment_results = perform_sentiment_analysis(twitter_data_for_the_month)
        get_the_mood(sentiment_results)  