import pandas as pd

import os

d = os.getcwd()

csv = pd.read_csv(d + '/../media/test.csv')

print(csv)