# Description
This data set includes descriptions of hypothetical samples corresponding to 23 species of gilled mushrooms in the Agaricus and Lepiota Family (pp. 500-525). Each species is identified as definitely edible, definitely poisonous, or of unknown edibility and not recommended. This latter class was combined with the poisonous one.

![1652813086(1)](https://user-images.githubusercontent.com/90291484/168887305-ae6b7eb5-6c18-4954-bb9d-7200cd2b2765.png)

Source: Schlimmer,J.S. (1987). Concept Acquisition Through Representational Adjustment (Technical Report 87-19). Doctoral disseration, Department of Information and Computer Science, University of California, Irvine. https://archive.ics.uci.edu/ml/datasets/mushroom

1.Data Set: agaricus-lepiota.data
2.Description: agaricus-lepiota.names

# Part 1 Import and Plot the Dataset

Each species is identified as edible, or poisonous, as shown in the first column. According to the attribute information, I assigned names for the features. The names file also mentions that missing values are coded as '?', and that there are 2480 of them. Before continuing, these rows containing missing values will be removed from the data.

The next step in my analysis is to plot the data and see if I can spot any relationships between my features and my class variable, or between two features. The result of this plotting is shown as Figure 1. It is very difficult to tell if there are any relationships from this plot, so I will need to take a closer look at some smaller sets of relationships. The plots below show my results from plotting 'stalk-surface-below-ring' and 'stalk-surface-above-ring' (Figure 2).

![1652813675](https://user-images.githubusercontent.com/90291484/168889017-23604ae8-d066-4d1c-9e99-6705045a57f5.png)
![1652813720](https://user-images.githubusercontent.com/90291484/168889143-4072cbaa-a62c-4831-892a-8fc220eb1e15.png)

