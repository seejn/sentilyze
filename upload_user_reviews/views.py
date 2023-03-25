from django.shortcuts import render, redirect

from django.contrib import messages

from django.core.files.storage import FileSystemStorage

from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer

import os
import numpy as np
import pandas as pd
import re
import nltk
import pickle
import joblib
import collections
# Create your views here.


import os
d = os.getcwd()

def csv_index(request):
    
    if(request.method == "POST"):
        upload_csv(request)

    context = {
        "document_title":"Upload CSV",
    }

    return render(request, 'upload_user_reviews/upload_csv.html', context)

def upload_csv(request):
    uploaded_file = request.FILES["csv_document"]
    
    if not uploaded_file.name.endswith(('csv', 'tsv')):
        messages.error(request, "Invalid file type")
        return render(request, 'upload_user_reviews/upload_csv.html')
    
    path = 'media/uploaded_csv_file/{}/'.format(request.session['company_pk'])
    savefile = FileSystemStorage(path)
    name = savefile.save(uploaded_file.name, uploaded_file)


    file_directory = d + '/' + path + name

    print(file_directory)
    if uploaded_file.name.endswith("csv"):
        dataset = pd.read_csv(file_directory)
    else:
        dataset = pd.read_csv(file_directory, delimiter="/t",quoting=3)
    result = analyze_user_csv(dataset)
    
    if(result.empty == False):
        result.to_csv(d+'/'+path+'predicted_review.csv', sep=',', encoding='UTF-8', index=False)
        messages.success(request, "Your file was uploaded")
        return render(request, 'upload_user_reviews/upload_csv.html')
    
    message = "File content is empty"
    messages.error(request, message)

def analyze_user_csv(dataset):
    rows = dataset.shape[0]
    print("rows: ",rows)
    # data = pd.DataFrame(data=my_file, index=None)
    # print(my_file['Review'])

    stopwords = nltk.corpus.stopwords.words('english')

    from nltk.corpus import stopwords
    from nltk.stem.porter import PorterStemmer
    ps = PorterStemmer()

    all_stopwords = stopwords.words('english')
    all_stopwords.remove('not')

    corpus = []
    print(dataset.info())

    review_col = dataset.iloc[:,-1]
    for i in range(0,rows):
        review = re.sub('[^a-zA-Z]', ' ', review_col[i])
        review = review.lower()
        review = review.split()
        review = [ps.stem(word) for word in review if not word in set(all_stopwords)]
        review = ' '.join(review)
        corpus.append(review)

    cvFile = d+'/media/BoW-Sentiment Model.pkl'
    cv = pickle.load(open(cvFile, "rb"))

    X_fresh = cv.transform(corpus).toarray()
    print(X_fresh.shape)

    classifier = joblib.load(d+'/media/Classifier_Sentiment Model')

    y_pred = classifier.predict(X_fresh)
    print(y_pred)

    dataset['Status'] = y_pred.tolist()
    dataset.head()

    return dataset

def get_review_status(review):

    stopwords = nltk.corpus.stopwords.words('english')

    from nltk.corpus import stopwords
    from nltk.stem.porter import PorterStemmer
    ps = PorterStemmer()

    all_stopwords = stopwords.words('english')        
    
    all_stopwords.remove('not')

    corpus = []
    review = re.sub('[^a-zA-Z]', ' ', review)
    review = review.lower()
    review = review.split()
    review = [ps.stem(word) for word in review if not word in set(all_stopwords)]
    review = ' '.join(review)
    corpus.append(review)

    cvFile = d+'/media/BoW-Sentiment Model.pkl'
    cv = pickle.load(open(cvFile, "rb"))
    
    X_fresh = cv.transform(corpus).toarray()
    
    classifier = joblib.load(d+'/media/Classifier_Sentiment Model')
    
    y_pred = classifier.predict(X_fresh)
    return y_pred
    

def feedback_result(request):
    import dask.dataframe as dd
    path = 'media/uploaded_csv_file/{}/'.format(request.session['company_pk'])
    dataset = dd.read_csv(d + '/' + path +'predicted_review.csv')
    goto = False
    additional_field = get_additional_field(dataset)
    print(request.method)
    print("additional_field")
    print(len(additional_field))

    if request.method == 'POST':
        print(request.POST.get("label"))
        label = request.POST.get("label")
        goto = True
    elif len(additional_field) > 0:
        label = additional_field[0]
    else:
        label = False

    print(label)
    context1 = overall_feedback(dataset)

    if not label == False:
        context2 = label_feedback(dataset, label)
    else:
        context2 = label

    context = {
        "document_title":"Result",
        "goto": goto,
        "additional_field": additional_field,
        "context1": context1,
        "context2": context2,
    }
    return render(request, 'upload_user_reviews/results.html', context)


def get_additional_field(dataset):
    fields = np.array(dataset.columns)
    additional_fields = []
    for idx,x in np.ndenumerate(fields):
        if idx[0] < (len(fields) - 2):
            additional_fields.append(x)
    
    return additional_fields

def overall_feedback(dataset):

    pos_review = dataset[(dataset['Status'] == 1)]
    neg_review = dataset[(dataset['Status'] == 0)]

    pos_review = pos_review.compute()
    neg_review = neg_review.compute()

    # print(pos_review)
    # print(neg_review)

    keys = ['positive','negative']
    review = [pos_review.shape[0],neg_review.shape[0]] # this the count of pos and neg feedback
    
    columns = dataset.columns
    dataset = np.array(dataset)
    print(keys)
    print(review)

    row_count = dataset.shape[0]
    column_count = dataset.shape[1]

    context = {
        "row_count": row_count,
        "column_count": column_count,
        "columns": columns,
        "dataset": dataset,
        "keys": keys,
        "review": review
    }
    return context

def label_feedback(dataset, field):
    print("label_feedback")
    list1= np.array(dataset[field])
    print(list1)

    unq_value = []
    pos_review = []
    neg_review = []

    filter_value = np.unique(list1)
    print(filter_value)

    for x in filter_value:
        unq_value.append(x)

    print(unq_value)

    for x in filter_value:
        # print(x)
        x = dataset[(dataset[field] == x)]
        x = x[(x["Status"]==1)]
        x = x.compute()
        pos_review.append(x.shape[0])

    for x in filter_value:
        # print(x)
        x = dataset[(dataset[field] == x)]
        x = x[(x["Status"] == 0)]
        x = x.compute()
        neg_review.append(x.shape[0])

    # print(filter_label)
    # print(pos_review)    
    # print(neg_review)

    context={
        "field": field,
        "unq_value": unq_value,
        "pos_review": pos_review,
        "neg_review": neg_review
    }
    return context