#!/usr/bin/python
#Reducer.py
import sys

player_rating = {}

#Partitoner
for line in sys.stdin:
    line = line.strip()
    player, rating = line.split('\t')

    if player in player_rating:
        player_rating[player].append(double(rating))
    else:
        player_rating[player] = []
        player_rating[player].append(double(rating))

#Reducer
for player in player_rating.keys():
    final_rating = sum(player_rating[player])
    print '%s,%s'% (player, final_rating)