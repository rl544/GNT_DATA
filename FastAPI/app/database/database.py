from pymongo import MongoClient
import numpy as np
import pandas as pd
import dateutil

mongo_url = "mongodb://localhost:27017/"

client = MongoClient(mongo_url)
db = client['admin']

def get_donation_info():
    total_amount = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$group': {'_id': 'null', 'total': {'$sum': '$donation_amount'}, 'cnt': {'$sum': 1}}}])
    start_date = "2022-09-19T00:00:00.000+00:00"
    end_date = "2022-09-20T00:00:00.000+00:00"
    start_date = dateutil.parser.parse(start_date)
    end_date = dateutil.parser.parse(end_date)
    today_amount = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.20'}}, {'$group': {'_id': 'null', 'total': {'$sum': '$donation_amount'}, 'cnt': {'$sum': 1}}}])
    # print(pd.DataFrame(total_amount))
    # print(pd.DataFrame(today_amount))
    result = []
    for i in total_amount:
        result.append(i)
    for i in today_amount:
        result.append(i)
    return result

def get_donation_chart1():
    result = {}
    chart1_cate1 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 1}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    chart1_cate2 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 2}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    chart1_cate3 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 3}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    chart1_cate4 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 4}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    chart1_cate5 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 5}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    chart1_cate6 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 6}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    chart1_cate7 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 7}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    chart1_cate8 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 8}}, {'$group': {'_id': 'null', 'cnt': {'$sum': 1}}}])
    for i in chart1_cate1:
        result['아동·청소년'] = i['cnt']
    for i in chart1_cate2:
        result['어르신'] = i['cnt']
    for i in chart1_cate3:
        result['장애인'] = i['cnt']
    for i in chart1_cate4:
        result['다문화'] = i['cnt']
    for i in chart1_cate5:
        result['지구촌'] = i['cnt']
    for i in chart1_cate6:
        result['가족·여성'] = i['cnt']
    for i in chart1_cate7:
        result['동물'] = i['cnt']
    for i in chart1_cate8:
        result['환경'] = i['cnt']
    return result

def get_donation_chart2():
    result = {}
    chart1_cate1 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 1}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_cate2 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 2}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_cate3 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 3}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_cate4 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 4}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_cate5 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 5}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_cate6 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 6}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_cate7 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 7}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_cate8 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"category": 8}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    for i in chart1_cate1:
        result['아동·청소년'] = i['cnt']
    for i in chart1_cate2:
        result['어르신'] = i['cnt']
    for i in chart1_cate3:
        result['장애인'] = i['cnt']
    for i in chart1_cate4:
        result['다문화'] = i['cnt']
    for i in chart1_cate5:
        result['지구촌'] = i['cnt']
    for i in chart1_cate6:
        result['가족·여성'] = i['cnt']
    for i in chart1_cate7:
        result['동물'] = i['cnt']
    for i in chart1_cate8:
        result['환경'] = i['cnt']
    return result

def get_donation_chart3():
    result = {}
    chart1_day1 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.11'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day2 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.12'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day3 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.13'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day4 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.14'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day5 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.15'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day6 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.16'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day7 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.17'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day8 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.18'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day9 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.19'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    chart1_day10 = db.lavel2.aggregate([{'$project': {"_id": 0}}, {'$match': {"donation_date": '2022.09.20'}}, {'$group': {'_id': 'null', 'cnt': {'$sum': '$donation_amount'}}}])
    
    for i in chart1_day1:
        result['09/11'] = i['cnt']
    for i in chart1_day2:
        result['09/12'] = i['cnt']
    for i in chart1_day3:
        result['09/13'] = i['cnt']
    for i in chart1_day4:
        result['09/14'] = i['cnt']
    for i in chart1_day5:
        result['09/15'] = i['cnt']
    for i in chart1_day6:
        result['09/16'] = i['cnt']
    for i in chart1_day7:
        result['09/17'] = i['cnt']
    for i in chart1_day8:
        result['09/18'] = i['cnt']
    for i in chart1_day9:
        result['09/19'] = i['cnt']
    for i in chart1_day10:
        result['09/20'] = i['cnt']
    return result

def get_donation_list(dona_list):
    result = list()
    for id in dona_list:
        result.append(db.donation.find_one({'donation_id': id}, {'_id': 0}))
    return result

def get_donation_noun_list(donation_id):
    donation = db.donation.find_one({'donation_id': donation_id}, {'_id': 0})
    sub = donation['most_noun']
    result = []
    for i in sub:
        sub_dic = {}
        sub_dic['x'] = i[0]
        sub_dic['value'] = i[1]
        result.append(sub_dic)

    return result