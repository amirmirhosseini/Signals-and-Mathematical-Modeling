import numpy as np  
import pandas as pd  

#QUESTIN 3 _ 2ND PART

# Sample data for training - replace with your actual data  
X_train = pd.DataFrame({  
    'text': ['This is spam message', 'This is not spam', 'Offer just for you!', 'Hello friend']  
})  
y_train = np.array([1, 0, 1, 0])  # 1 for spam, 0 for non-spam  

# Create vocabulary from training data  
all_words = set()  
for text in X_train['text']:  
    for word in text.split():  
        all_words.add(word.lower())  

all_words = list(all_words)  
vocab_size = len(all_words)  

# Initialize spam and non-spam word counts  
spam = np.zeros(vocab_size)  
non_spam = np.zeros(vocab_size)  

# Count occurrences of words in spam and non-spam emails  
for idx, text in enumerate(X_train['text']):  
    for word in text.split():  
        word = word.lower()  
        if y_train[idx] == 1:  # Spam  
            spam[all_words.index(word)] += 1  
        else:  # Non-spam  
            non_spam[all_words.index(word)] += 1  

# Calculate conditional probabilities with Laplace smoothing  
def apply_laplace_smoothing(counts, total_count, vocab_size):  
    return (counts + 1) / (total_count + vocab_size)  

conditional_probability = [  
    apply_laplace_smoothing(spam, spam.sum(), vocab_size),  
    apply_laplace_smoothing(non_spam, non_spam.sum(), vocab_size)  
]  

# Calculate probability of spam and non-spam  
spam_chance = len(y_train[y_train == 1]) / len(y_train)  
non_spam_chance = len(y_train[y_train == 0]) / len(y_train)  

# Probability functions  
def spam_probability(text):  
    final = spam_chance  # Use prior probability  
    for i in range(len(all_words)):  
        word = all_words[i]  
        if word in text.lower():  
            final *= conditional_probability[0][i]  
    return final  

def non_spam_probability(text):  
    final = non_spam_chance  # Use prior probability  
    for i in range(len(all_words)):  
        word = all_words[i]  
        if word in text.lower():  
            final *= conditional_probability[1][i]  
    return final  

def is_spam(text):  
    return spam_probability(text) > non_spam_probability(text)  

# Test data  
X_test = pd.DataFrame({'text': ['Win a million dollars', 'Hi there!']})  
y_test = np.array([1, 0])  # Replace with actual test labels  

# Make predictions  
y_predicted = X_test.copy()  
is_spam_vectorized = np.vectorize(is_spam)  
y_predicted['predicted'] = is_spam_vectorized(y_predicted['text'])  

# Calculate accuracy  
correct_predictions = (y_predicted['predicted'].astype(int) == y_test).sum()  
accuracy = (correct_predictions / len(y_test)) * 100  

# Print results  
print("Predictions:")  
print(y_predicted)  
print(f"Accuracy: {accuracy:.2f}%")