# Q2_EPS_CA0
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import seaborn as sns
np.random.seed(601)  

#1st_part
pwm=[]
list_of_tuples = [(8,4,0.7),(10,2,0.7),(8,4,0.3),(9,3,0.5),(5,7,0.5)]
for v1,v2,p in list_of_tuples:
    q=(1-p)
    if v1>v2:
        pwm.append((p**v1)*(q**v2)/((p**v1)*(q**v2)+(p**v2)*(q**v1)))
    else:
        pwm.append((p**v2)*(q**v1)/((p**v1)*(q**v2)+(p**v2)*(q**v1)))

print(pwm)


#2nd_part & #3rd_part


n_simulations = int((10**4)%((30**2)*10*((2**3)/(3**2))) )

n_voters = 12 


p_values = np.linspace(0, 1, 11)  


def voting_simulation(p, n_voters):  
    majority_correct = 0  
    global n_simulations

    for e in range(n_simulations):  
        votes = np.zeros(n_voters)   
        for i in range(n_voters):  

            if np.random.rand() < p:  
                votes[i] = 1  
            else:  
                votes[i] = 0  
                

        if not np.sum(votes) <= n_voters / 2:  
            majority_correct += 1  

    return majority_correct / n_simulations  


majority_accuracies = [voting_simulation(p, n_voters) for p in p_values]  
final_accuracies = []
for i in range(len(majority_accuracies)):
    final_accuracies.append(majority_accuracies[i]*100)

plt.figure(figsize=(8, 5))  
plt.plot(p_values, final_accuracies, marker='D', linestyle='--', color='navy')  
plt.xlabel('(p)')  
plt.xticks(np.arange(0, 1.1, 0.1))  
plt.ylabel('majority accuracies (by percentage)')
plt.yticks(np.arange(0, 110, 10))  
plt.title(" the affect of voters' accuracies on majoriy's accuracies. ")  
plt.axhline(50, color='crimson', linestyle='-.', label='Threshold of correct decision (50%)')  
plt.legend()  
plt.grid()  
plt.show()

print("3rd part's answer is p=0.9")

#4th_part

Xs = np.arange(26, 51, 1)
Ps = np.linspace(0, 1, 11)
p2wm = []

for i in Xs:
    Ys = 50 - i
    for j in Ps:
        Qs = 1 - j
        prob2 = (j**i) * (Qs**Ys) / ((j**i) * (Qs**Ys) + (Qs**i) * (j**Ys))
        #if np.isnan(prob2):
        #    print(i,j)
        if j==1:
            prob2=1
        if j==0:
            prob2=0
        #Print(prob2)
        p2wm.append((prob2, i, j))



prob2_values, Xs_values, Ps_values = zip(*p2wm)

prob2_values = np.array(prob2_values)
Xs_values = np.array(Xs_values)
Ps_values = np.array(Ps_values)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

sc = ax.scatter(Ps_values, Xs_values, prob2_values, c=prob2_values, cmap='viridis')

ax.xaxis.set_major_locator(plt.MultipleLocator(0.1))
ax.yaxis.set_major_locator(plt.MultipleLocator(1))
ax.zaxis.set_major_locator(plt.MultipleLocator(0.05))

cbar = plt.colorbar(sc, ax=ax)
cbar.set_label('accuracy values')

ax.set_xlabel('P (X-axis)')
ax.set_ylabel('Majority(of 50 people) (Y-axis)')
ax.set_zlabel('accuracy (Z-axis)')
ax.set_title('3D Plot of 2-2-Question')

plt.show()


#4th_part
accuracy_matrix = np.zeros((len(Xs), len(Ps))) 

for i, num_voters in enumerate(Xs):  
    Ys = 50 - num_voters  
    for j, p in enumerate(Ps):  
        Qs = 1 - p  
        prob2 = (p**num_voters) * (Qs**Ys) / ((p**num_voters) * (Qs**Ys) + (Qs**num_voters) * (p**Ys))  
        
        if p == 1:  
            prob2 = 1  
        if p == 0:  
            prob2 = 0  
        
        accuracy_matrix[i, j] = prob2   

 
plt.figure(figsize=(10, 6))  
sns.heatmap(accuracy_matrix, annot=True, cmap='viridis',   
            xticklabels=np.round(Ps, 2), yticklabels=Xs,  
            cbar_kws={'label': 'Accuracy'})  

plt.title('Effect of P and Number of Voters (the majority) on Decision Accuracy')  
plt.xlabel('P Values')  
plt.ylabel('Number of Voters')  
plt.show()