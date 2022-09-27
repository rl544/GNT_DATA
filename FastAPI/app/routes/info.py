from fastapi import APIRouter
from ..database.database import *
from ..models.user_meta import *
import pandas as pd
import numpy as np
from pydantic import BaseModel
from datetime import datetime
import catboost as cb

router = APIRouter()

class Predict(BaseModel):
    category: int
    donation_limit: int
    create_time: str
    end_time: str

@router.get('/info4', tags=["Info"])
def get_info():
    infos = get_donation_info()
    print(infos)
    result = {}
    for i in range(len(infos)):
        if i == 0:
            result['total_amount'] = infos[i]['total']
            result['total_cnt'] = infos[i]['cnt']
        else:
            result['today_amount'] = infos[i]['total']
            result['today_cnt'] = infos[i]['cnt']
    return result

@router.get('/chart1', tags=["Chart1"])
def get_chart1():
    infos = get_donation_chart1()
    return infos

@router.get('/chart2', tags=["Chart2"])
def get_chart2():
    infos = get_donation_chart2()
    return infos

@router.get('/chart3', tags=["Chart3"])
def get_chart3():
    infos = get_donation_chart3()
    return infos

@router.post('/predict_result', tags=['Predict'])
def get_predict_result(predict: Predict):
    X_train = pd.read_json('./app/models/cat_X_train.json')
    y_train = pd.read_json('./app/models/cat_y_train.json')
    params = {'learning_rate': 0.029999999329447746, 'max_depth': 2, 'n_estimators': 300, 'eval_metric': 'Accuracy', 'loss_function': 'MultiClass'}
    X_test = pd.Series({
        'category_children':0,
        'category_oldman':0,
        'category_disabled':0,
        'category_multiculture':0,
        'category_global':0,
        'category_family':0,
        'category_animal':0,
        'category_environment':0,
        'donation_limit': predict.donation_limit,
        'donation_percent_money':(datetime.strptime(predict.end_time, '%Y-%m-%d') - datetime.strptime(predict.create_time, '%Y-%m-%d')).days,
    })
    if predict.category == 1:
        X_test['category_children'] = 1
    elif predict.category == 2:
        X_test['category_oldman'] = 1
    elif predict.category == 3:
        X_test['category_disabled'] = 1
    elif predict.category == 4:
        X_test['category_multiculture'] = 1
    elif predict.category == 5:
        X_test['category_global'] = 1
    elif predict.category == 6:
        X_test['category_family'] = 1
    elif predict.category == 7:
        X_test['category_animal'] = 1
    else:
        X_test['category_environment'] = 1

    X_test = pd.DataFrame(X_test).transpose()

    cb_train = cb.Pool(data=X_train, label=y_train)
    cbmodel = cb.train(pool=cb_train, params=params)
    y_pred = np.argmax(cbmodel.predict(X_test), axis=1)
    y_pred_proba = cbmodel.predict(X_test, prediction_type='Probability')
    result = dict()

    if y_pred[0]==0:
        result['result'] = 0
        result['prob0'] = float(y_pred_proba[0][0])
        result['prob1'] = float(y_pred_proba[0][1])
    else:
        result['result'] = 1
        result['prob0'] = float(y_pred_proba[0][0])
        result['prob1'] = float(y_pred_proba[0][1])
    return result