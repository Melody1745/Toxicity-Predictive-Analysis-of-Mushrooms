# Description
1.Data Set: agaricus-lepiota.data

2.Description: agaricus-lepiota.names

This data set includes descriptions of hypothetical samples corresponding to 23 species of gilled mushrooms in the Agaricus and Lepiota Family (pp. 500-525). Each species is identified as definitely edible, definitely poisonous, or of unknown edibility and not recommended. This latter class was combined with the poisonous one.

![1652813086(1)](https://user-images.githubusercontent.com/90291484/168887305-ae6b7eb5-6c18-4954-bb9d-7200cd2b2765.png)

Source: Schlimmer,J.S. (1987). Concept Acquisition Through Representational Adjustment (Technical Report 87-19). Doctoral disseration, Department of Information and Computer Science, University of California, Irvine. https://archive.ics.uci.edu/ml/datasets/mushroom

# Part 1 Import and Plot the Dataset

Each species is identified as edible, or poisonous, as shown in the first column. According to the attribute information, I assigned names for the features. The names file also mentions that missing values are coded as '?', and that there are 2480 of them. Before continuing, these rows containing missing values will be removed from the data.

The next step in my analysis is to plot the data and see if I can spot any relationships between my features and my class variable, or between two features. The result of this plotting is shown as Figure 1. It is very difficult to tell if there are any relationships from this plot, so I will need to take a closer look at some smaller sets of relationships. The plots below show my results from plotting 'stalk-surface-below-ring' and 'stalk-surface-above-ring' (Figure 2). It appears there may be a relationship between 'ssar' and 'ssbr'.

![1652813675](https://user-images.githubusercontent.com/90291484/168889017-23604ae8-d066-4d1c-9e99-6705045a57f5.png)

![1652813720](https://user-images.githubusercontent.com/90291484/168889143-4072cbaa-a62c-4831-892a-8fc220eb1e15.png)

# Part 2 Prepare the Data
The first step in preparing my data for clustering is to convert the categorical variables into numeric. Each variable was assigned a value from 10 to 150 (space by 10) for each category. The mapping for each feature of values to integers is shown in Table 1. Moreover, I also separated the ‘class’ column since it’s the target value that I want to predict. 

![1652813915(1)](https://user-images.githubusercontent.com/90291484/168889749-6ba87f84-28de-4757-a1d4-46a52fe559d2.png)

In order to subset the dataset for prediction, I need to eliminate some attributes. According to the correlationship between features, I chose 11 features which have more influence on others.

## Part 3 Clustering Data Set
The next step for the analysis is to take the normalized features and apply kmeans clustering. I started with 2 clusters and repeated the analysis for up to 7 clusters. The results of the analysis are shown below. 

![1652816569(1)](https://user-images.githubusercontent.com/90291484/168896736-f2d2b964-c3a7-4e12-b0a4-5eb0bdd91646.png)

## Part 4 Prediction
I start part 4 by performing knn on my testing data and comparing the results to the clustering. To select the number of clusters to use in this test, I look at the within sum of squares plot generated in part 3 (Figure 3). The chart shows that the optimal number of clusters should be around 3-4. Since the question suggests I also perform my analysis for 5,7,and 9 clusters, I perform this analysis 4 times, with 3,5,7, and 9 clusters. 

![1652816741(1)](https://user-images.githubusercontent.com/90291484/168897248-b572e7f1-cd1a-4ade-8eb5-88ee03d090e1.png)

If I compare the results of knn classification of the test set to the kmeans clustering labels when k=3, I notice they vary drastically. This could be because the train and test sets possess different qualities, so their clusters are created using different factor weights. So I take the kmeans generated labels and move on to linear modeling.

I take the kmeans generated labels and move on to linear modeling. For the linear model, I bring the poisonous/edible class back into the data. I convert these categories to 1,0 values respectively and use them as the dependent variable in my regression. The results of my first regression model show that feature ‘rtype’ is the least significant and should be eliminated. Applying stepwise regression, I retrain the model with my new features and check the results. The p-values of all features after stepwise regression are less than 0.05, which means that this model passes the significance test. The anova - Analysis of Variance on the model also shows the gap between the null deviance and the residual deviance is significant.

Figure 4 shows me the residual plots from the model, and they can be interpreted as follows:

![1652817379(1)](https://user-images.githubusercontent.com/90291484/168898949-f989c21a-42c4-409a-b407-cf8631282fa7.png)

•	Residuals vs Fitted: my residuals appear to be independent from the predicted values and relatively normally distributed. The strange shape is due to the nature of my true values (0,1 classes).

•	Normal Q-Q: For this plot, the residuals should follow the trend line top confirm normal distribution. In my case this is roughly true, however some points are a bit skewed.

•	Scale Location: Again, the strange shape is expected due to the nature of my true values.

•	Residuals vs Leverage: In this plot, those points in the upper left and upper right may be highly influential on my model.

To perform the prediction, I used the predict() function on the test set and retrieved values. Then, I clustered these predictions using kmeans, and compared the results to the true values generated earlier in this section. K=5 performs best according to the precision rate which equals to 22.79%; The precision rate almost remains the same for k=3 vs. k=9.

![1652817399(1)](https://user-images.githubusercontent.com/90291484/168899018-4736b988-2c99-4afb-ab27-60edfa2a640a.png)

## Part 5 Conclusion
After comparing the precision results for different numbers of clusters, although the authors of dataset claim 2 or 3 classes, I found that the optimal classification number should be 5. 

K-Means and KNN are both machine learning algorithms. However, KNN is an algorithm used for classification, while K-Means is an unsupervised algorithm used for clustering. I need to generate labels by K-Means method at first, then apply these labels to data set for KNN analysis.
