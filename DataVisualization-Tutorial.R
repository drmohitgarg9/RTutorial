##Data Visualization####


#DataSet Creation 

# creation of two vectors 

Year <- c(2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003)

#Vector Total Publications
TP <- c(2350, 2378, 2192, 2036, 2073, 1637, 1455, 1287, 1051, 785, 575, 406, 190, 126, 87, 60, 22, 5)

#Create a data frame of two vectors ( columns)
?data.frame

dfViz <- data.frame(Year, TP)

# Display the data frame
?View

View(dfViz)


#Let's plot this data

?plot


plot(dfViz$Year, dfViz$TP)


#Some modification 

#1. Type of points 

?plot

plot(dfViz$Year, dfViz$TP, type = "o")

#o means both points and line 

# Adding labels of X-axis


plot(dfViz$Year, dfViz$TP, type = "o", xlab = "Year", ylab = "TP")

#Adding title to the axis 

plot(dfViz$Year, dfViz$TP, type = "o", xlab = "Year", ylab = "TP", main = "TP over Years")

#Customising Line 
#pch
?pch

plot(dfViz$Year, dfViz$TP, type = "o", pch=7,
     xlab = "Year", ylab = "TP", main = "TP over Years")


#Adding Colors 

plot(dfViz$Year, dfViz$TP, type = "o", pch=7, col = "red", 
     xlab = "Year", ylab = "TP", main = "TP over Years")


#Adding color shades
#https://htmlcolorcodes.com/

plot(dfViz$Year, dfViz$TP, type = "o", pch=7, col = "#1FEEF1", 
     xlab = "Year", ylab = "TP", main = "TP over Years")

#Export the plot 


#We need more modifications like we 
#need to change the color by trends
#dividing the whole plot in two or three parts

# library
library(plotrix)

#create color palette
library(RColorBrewer)
my_colors = brewer.pal(7, "Set2") 
my_colors1=c("red", "green","blue")
# Read data
x<-a$Year
y<-a$TP

# Plot x and y
par(mar=c(4,4,2,2))
clplot(x, y, main="",lwd=5,labels=y,levels=c(190,1455),col=my_colors1, showcuts=T , bty="n",xlab="Year", ylab = "Number of Publications", axes=F)

axis(1, at = seq(2003, 2020, by= 1), las=2) #For X axis 
axis(2, at = seq(0, 2400, by = 100), las=2)  #For Y axis

legend("top",
       c("2003-2008","2009-2014","2015-2020"),
       fill=c("red","green","blue")
)

selected <- c(1,2, 7, 13)
text(x[selected], y[selected],
     labels = y[selected],
     cex = 0.9, pos = 1, col = "black")


###Bar Chart #####

#Difference between bar chart and histogram

#Barplot

#Dataset

# Create a data frame with example data
Year <- c(2020, 2019, 2018, 2017, 2016)
Article <- c(10, 8, 7, 9, 5)
Conference_Proceedings <- c(3, 5, 4, 2, 3)
Review <- c(2, 1, 3, 1, 2)
Note <- c(1, 2, 1, 3, 2)
Editorial <- c(1, 1, 1, 1, 1)

# Calculate total publications
TP <- Article + Conference_Proceedings + Review + Note + Editorial

# Create data frame with the total publications
dfBar <- data.frame(Year, Article, Conference_Proceedings, Review, Note, Editorial, TP)

View(dfBar)

write.csv(dfBar, file = "dfBar.csv")


dfBar<-read.csv("dfBar.csv")


#Yearwise total publications as bar chart

?barplot

# Bar chart for Total Publications
barplot(dfBar$TP, names.arg = dfBar$Year, col = "brown", 
        xlab = "Year", ylab = "Total Publications", 
        main = "Total Publications by Year")


#But this is not complete

#We want to add more information in these bar
#how much is representing article, conference and so on


#Stacked Barplot


dfStack<-read.csv("StackPlot-Data.csv")

#Yearwise Publications 

table(dfStack$Year)

#Yearwise publications and document type 

table(dfStack$Year, dfStack$Document.Type)

dfPubDoc<-table(dfStack$Year, dfStack$Document.Type)

View(dfPubDoc)

dfPubDoc<-data.frame(dfPubDoc)

View(dfPubDoc)

library(ggplot2)

ggplot(dfPubDoc, aes(fill=Var2, y=Freq, x=Var1)) + 
  geom_bar(position="stack", stat="identity")+
  labs(title = "Publication DIstribution Pattern",
       x = "Year",  # Change the x-axis label
       y = "Number of Publications",  # Change the y-axis label
       fill = "") +  # Change the legend title
  theme_minimal() +
  theme(legend.position = "top",axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))  

#Stcaked Bar plot with data points 

library(ggplot2)

ggplot(dfPubDoc, aes(fill=Var2, y=Freq, x=Var1)) + 
  geom_bar(position="stack", stat="identity") +
  geom_point(aes(color=Var2), position=position_stack(vjust=0.5), size=3, shape=21, fill="white") + # Add data points
  labs(title = "Publication Distribution Pattern",
       x = "Year",  # Change the x-axis label
       y = "Number of Publications",  # Change the y-axis label
       fill = "") +  # Change the legend title
  theme_minimal() +
  theme(legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))




#Pie Chart 

















#Calendar Heatmap

