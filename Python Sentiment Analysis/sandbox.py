# -*- coding: utf-8 -*-
"""
Created on Mon Aug 24 21:33:26 2015

@author: ankush
"""

from gensim import corpora, models, similarities
from collections import defaultdict

def clean(documents):
    stoplist=set("to and for a an the is in of for to into if upto".split())
    texts=[[word for word in document.lower().split() if word not in stoplist] for document in documents]
    print "\nThe text after removing stopwords\n...\n..\n."    
    for i in texts: print i
    
    frequency=defaultdict(int)
    for text in texts:
        for token in text:
            frequency[token] +=1
            
    print"\n Removing low frequency words\n...\n..\n."        
    texts=[[token for token in text if frequency[token]>1] for text in texts] 
    for i in texts: print i
    
    dictionary=corpora.Dictionary(texts)
    #dictionary.save('/tmp/deerwester.dict')
    print (dictionary.token2id) 
        
    
def main():
    documents = ["Human machine interface for lab abc computer applications",
              "A survey of user opinion of computer system response time",
              "The EPS user interface management system",
              "System and human system engineering testing of EPS",
              "Relation of user perceived response time to error measurement",
              "The generation of random binary unordered trees",
              "The intersection graph of paths in trees",
              "Graph minors IV Widths of trees and well quasi ordering",
              "Graph minors A survey"]
    #print documents
    clean(documents)
if __name__=="__main__":
    main()
