from fastapi import APIRouter
from ..database.database import *
from ..models.user_meta import *
import pandas as pd
import numpy as np
import pickle
from pydantic import BaseModel
from typing import List
import lightfm

router = APIRouter()

class User(BaseModel):
    user_id: int
    donation_cnt: int
    donation_amount: int
    category_children: float
    category_oldman: float
    category_disabled: float
    category_multiculture: float
    category_global: float
    category_family: float
    category_animal: float
    category_environment: float

def sample_recommendation(model, idx, user_ids, donation_meta, user_meta):
    cnt = 1
    for u_id in user_ids:
        if cnt==1:
            scores = model.predict(int(user_meta[user_meta.user_id==u_id].index[0]), np.arange(len(donation_meta)))
        else:
            scores += model.predict(int(user_meta[user_meta.user_id==u_id].index[0]), np.arange(len(donation_meta)))
    
    dona_items = idx[np.argsort(-scores)]
    sub_donations = []

    for x in dona_items[:20]:
        sub_donations.append(x)
    
    rec_donations = []
    
    for i in sub_donations:
        rec_donations.append(donation_meta[donation_meta['donation_id']==i]['donation_id'].iloc[0])
    
    return rec_donations

def get_user_list(user, user_meta):
    new_user = pd.DataFrame(user_meta.loc[0]).transpose()
    new_user_idx = new_user.index
    new_user.loc[new_user_idx, ('user_id')] = user.user_id
    new_user.loc[new_user_idx, ('donation_amount')] = user.donation_amount
    new_user.loc[new_user_idx, ('donation_cnt')] = user.donation_cnt
    new_user.loc[new_user_idx, ('category_children')] = user.category_children
    new_user.loc[new_user_idx, ('category_oldman')] = user.category_oldman
    new_user.loc[new_user_idx, ('category_disabled')] = user.category_disabled
    new_user.loc[new_user_idx, ('category_multiculture')] = user.category_multiculture
    new_user.loc[new_user_idx, ('category_global')] = user.category_global
    new_user.loc[new_user_idx, ('category_family')] = user.category_family
    new_user.loc[new_user_idx, ('category_animal')] = user.category_animal
    new_user.loc[new_user_idx, ('category_environment')] = user.category_environment

    cate_list = ['category_children', 'category_oldman', 'category_disabled', 'category_multiculture',
       'category_global', 'category_family', 'category_animal', 'category_environment']

    sub_cate_list = []
    for i in cate_list:
        sub_cate_list.append((new_user[i][0], i))
    sub_cate_list = sorted(sub_cate_list, reverse=True)
    real_cate = []
    cnt = 0
    for i, j in sub_cate_list:
        if cnt >= 3:
            break
        if cnt >= 1 and i == 0:
            break
        real_cate.append(j)
        cnt += 1
    sub_user = user_meta.copy()
    for i in range(1, len(real_cate)):
        sub_user[real_cate[i]] = sub_user.apply(lambda x: abs(x[real_cate[i]]-new_user[real_cate[i]].iloc[0]), axis=1)
    sub_col = list(sub_user.columns)[1:]
    sub_user.insert(0, 'favorSum', 0)
    sub_user.favorSum = sum(sub_user[col_i] for col_i in sub_col)
    sub_user = sub_user.sort_values('favorSum', ascending=False)
    real_user = []
    for i in range(3):
        real_user.append(sub_user.iloc[i]['user_id'])
    real_user = [int(i) for i in real_user]
    return real_user

@router.post('/recommend', tags=["Recommend"])
def rec_size(user: User):
    donation_meta = pd.read_json('./app/models/donation_meta')
    user_meta = pd.read_json('./app/models/user_meta')
    user_list = get_user_list(user, user_meta)
    model = pickle.load(open('./app/models/model_rec.pickle', 'rb'))
    rec_category = sample_recommendation(model, donation_meta['donation_id'], user_list, donation_meta, user_meta)
    result = get_donation_list(rec_category)

    return result


@router.get('/donation/{donation_id}', tags=["Donation_Noun"])
def get_dona_noun(donation_id:str):
    result = get_donation_noun_list(donation_id)
    return result