# -- Import Library
import matplotlib.pyplot as plt
import pandas as pd

# -- Read Dataset
dataset = pd.read_csv("dataset/Taiwan.csv")

# -- One Hot Encoding (City、Year、Month)
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
encode_dataset = dataset.iloc[:, 0:3]

LE = LabelEncoder()
encode_dataset["城市"] = LE.fit_transform(encode_dataset["城市"])
encode_dataset["年"] = LE.fit_transform(encode_dataset["年"])
encode_dataset["月"] = LE.fit_transform(encode_dataset["月"])

OHE = OneHotEncoder(categories="auto")
encode_dataset = OHE.fit_transform(encode_dataset).toarray()
encode_dataset = pd.DataFrame(encode_dataset)

cat_dataset = pd.concat([encode_dataset, dataset], axis=1)
cat_dataset = cat_dataset.drop(["城市", "年", "月"], axis=1)

# -- Splitting Year
year_dataset = []
year_dataset.append(cat_dataset[~(cat_dataset[11].isin([1]))])
year_dataset.append(cat_dataset[(cat_dataset[11].isin([1]))])

# -- Splitting City
country_dataset = []
for i in range(2):
    city_dataset = []
    for j in range(3):
        city_dataset.append(year_dataset[i][(year_dataset[i][j].isin([1]))])
    country_dataset.append(city_dataset)

# # -- Splitting Data and Label
split_dataset = []
for i in range(2):
    split_dataset_2 = []
    for j in range(3):
        split_dataset_3 = [
            country_dataset[i][j].iloc[:, :-1].values,
            country_dataset[i][j].iloc[:, -1].values
        ]
        split_dataset_2.append(split_dataset_3)
    split_dataset.append(split_dataset_2)

# -- Feature Scaling
from sklearn.preprocessing import StandardScaler
for i in range(3):
    SC = StandardScaler()
    SC.fit(split_dataset[0][i][0])
    split_dataset[0][i][0] = SC.transform(split_dataset[0][i][0])
    split_dataset[1][i][0] = SC.transform(split_dataset[1][i][0])

# -- Predict
title = ["Taichung", "Taipei", "Kaohsiung"]

## -- Regression
### -- Polynomial Regression
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
for i in range(3):
    PF = PolynomialFeatures(degree=2)
    PF_trans = PF.fit_transform(split_dataset[0][i][0])
    LR = LinearRegression()
    LR.fit(PF_trans, split_dataset[0][i][1])
    LR_pred = LR.predict(PF.fit_transform(split_dataset[1][i][0]))

    plt.figure()
    plt.title(f"Polynomial Regression - {title[i]}")
    plt.plot(list(range(1, 13)), split_dataset[1][i][1], color="green", label="Test")
    plt.plot(list(range(1, 13)), LR_pred, color="red", label="Train")
    plt.legend()

## -- Classfication
### Setting Label at a multiple of 100
for i in range(2):
    for j in range(3):
        for k in range(len(split_dataset[i][j][1])):
            split_dataset[i][j][1][k] = round(split_dataset[i][j][1][k]/100)*100

### -- Decision Tree
from sklearn.tree import DecisionTreeClassifier
for i in range(3):
    DTC = DecisionTreeClassifier(criterion="entropy", random_state=0)
    DTC.fit(split_dataset[0][i][0], split_dataset[0][i][1])
    DTC_pred = DTC.predict(split_dataset[1][i][0])

    plt.figure()
    plt.title(f"Decision Tree - {title[i]}")
    plt.plot(list(range(1, 13)), split_dataset[1][i][1], color="green", label="Test")
    plt.plot(list(range(1, 13)), DTC_pred, color="red", label="Train")
    plt.legend()

### -- Logistic Regression
from sklearn.linear_model import LogisticRegression
for i in range(3):
    LGS = LogisticRegression(random_state=0)
    LGS.fit(split_dataset[0][i][0], split_dataset[0][i][1])
    LGS_pred = LGS.predict(split_dataset[1][i][0])

    plt.figure()
    plt.title(f"Logistic Regression - {title[i]}")
    plt.plot(list(range(1, 13)), split_dataset[1][i][1], color="green", label="Test")
    plt.plot(list(range(1, 13)), LGS_pred, color="red", label="Train")
    plt.legend()

### -- SVM
from sklearn.svm import SVC
for i in range(3):
    SVM_CLS = SVC(kernel="linear", probability=True, random_state=0)
    SVM_CLS.fit(split_dataset[0][i][0], split_dataset[0][i][1])
    SVM_pred = SVM_CLS.predict(split_dataset[1][i][0])

    plt.figure()
    plt.title(f"SVM - {title[i]}")
    plt.plot(list(range(1, 13)), split_dataset[1][i][1], color="green", label="Test")
    plt.plot(list(range(1, 13)), SVM_pred, color="red", label="Train")
    plt.legend()

plt.show()
