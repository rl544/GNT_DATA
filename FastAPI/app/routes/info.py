from fastapi import APIRouter
from ..database.database import *
from ..models.user_meta import *
import pandas as pd
import numpy as np
import pickle
from pydantic import BaseModel

router = APIRouter()

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