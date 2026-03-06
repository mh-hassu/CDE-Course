# Python Classes Repository

A comprehensive collection of Python learning materials covering fundamental to advanced concepts, organized as Jupyter notebooks for hands-on practice.

## Repository Structure

```
Python Classes/
├── var operat concat/
├── input condit slicing/
├── dictionaries/
├── for loop/
├── Functions/
├── dict tasks & functions/
├── Classes & tasks/
├── Lambda Functions/
├── oop over riding & loading/
├── oop inherit abstract data files/
├── python class 14(web scrping)/
├── file handling/
├── Numpy Matplotlib/
├── Online Numpy/
└── pandas matplotlib/
```

---

## Topics Covered

### 1. Variables, Operators & Concatenation
**File:** `var operat concat/var operat concat.ipynb`

This notebook introduces the fundamentals of Python programming:

#### Variables & Data Types
```python
name = 'Muhammad Hassaan'   # String
age = 17                    # Integer
weight = 65                 # Integer
is_present = True           # Boolean
```

#### Operators
| Operator | Description | Example |
|----------|-------------|---------|
| `+` | Addition | `10 + 5 = 15` |
| `-` | Subtraction | `15 - 13 = 2` |
| `*` | Multiplication | `2 * 6 = 12` |
| `/` | Division | `45 / 2 = 22.5` |
| `//` | Floor Division | `45 // 2 = 22` |
| `**` | Exponential | `3 ** 3 = 27` |
| `%` | Modulus | `40 % 3 = 1` |

#### String Concatenation Methods
```python
# Method 1: Using + operator
full_name = first_name + " " + last_name

# Method 2: Using format()
"{0} {1}".format("Muhammad", "Hassaan")

# Method 3: Using f-strings
f"{first_name} {last_name}"
```

#### PEMDAS Rule
- **P**arenthesis
- **E**xponential
- **M**ultiplication
- **D**ivision
- **A**ddition
- **S**ubtraction

---

### 2. Input, Conditional Statements & String Slicing
**File:** `input condit slicing/input condit slicing.ipynb`

#### User Input
```python
first_name = input('Enter Your first_name:')
age = int(input('Enter Your age:'))  # Type casting to integer
```

#### Conditional Statements
```python
# Grading System Example
marks = int(input("Enter Your marks:"))
if marks >= 90 and marks <= 100:
    print("Grade is A+")
elif marks >= 80 and marks <= 90:
    print("Grade is A")
# ... more conditions
else:
    print("Invalid Input")
```

#### Practical Examples
- Even/Odd checker
- Voting eligibility checker
- Shop budget calculator
- Time-based greeting system

#### String Slicing & Methods
```python
name = "Muhammad Hassaan"
name[0:8]           # Slicing: 'Muhammad'
name.count("a")     # Count occurrences
name.swapcase()     # Swap case
name.split()        # Split into list
```

---

### 3. Dictionaries
**File:** `dictionaries/dictionaries.ipynb`

#### Dictionary Operations
```python
lst = {
    "f_name": "Muhammad",
    "l_name": "Hassaan",
    "age": 17,
    "weight": 65,
    "is_present": True
}
```

#### Common Dictionary Methods
| Method | Description |
|--------|-------------|
| `keys()` | Returns all keys |
| `values()` | Returns all values |
| `items()` | Returns key-value pairs |
| `get(key)` | Returns value for key |
| `update(key=value)` | Updates dictionary |
| `pop(key)` | Removes and returns value |
| `popitem()` | Removes last item |
| `setdefault(key, value)` | Sets default if key doesn't exist |
| `fromkeys(seq)` | Creates dictionary from sequence |

---

### 4. For Loops
**File:** `for loop/for loop.ipynb`

#### Basic Loop Examples
```python
# Multiplication Table
table = int(input("Enter the number: "))
times = int(input("Enter how many times: "))
for temp in range(times):
    print(f"{table} x {temp+1} = {table * (temp+1)}")
```

#### List Comprehensions
```python
# Basic list comprehension
lst = [temp for temp in range(2, 20, 3)]

# With conditional
lst = [f"{temp} even" if temp % 2 == 0 else f"{temp} odd" for temp in range(1, 10)]

# Dictionary comprehension
lst = {temp: ("even" if temp % 2 == 0 else "odd") for temp in range(1, 10)}
```

#### Nested Loops
```python
for table in range(2, 6):
    for temp in range(times):
        print(f"{table} * {temp+1} = {table * (temp+1)}")
```

---

### 5. Functions
**File:** `Functions/Functions.ipynb`

#### Function Basics
```python
def addition():
    num1 = int(input("Enter the First number: "))
    num2 = int(input("Enter the Second number: "))
    print(num1 + num2)
```

#### Parameters & Arguments
```python
def Calculator(num1, num2, operator):
    if operator == "+":
        print(f"The Sum is {num1 + num2}")
    elif operator == "-":
        print(f"The Difference is {num1 - num2}")
    # ... more operations
```

#### Default Parameters
```python
def greet(first_name, place_name="Karachi"):
    return f"Hi, {first_name} Welcome to {place_name}.."
```

#### Variable Arguments (*args, **kwargs)
```python
# *args for variable positional arguments
def add_nums(name, *nums):
    print(f"{name}: {sum(nums)}")

# **kwargs for variable keyword arguments
def add_nums(name, **nums):
    print(f"{name}: {sum(nums.values())}")
```

#### Recursion
```python
def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)
```

---

### 6. Dictionary Tasks & Functions
**File:** `dict tasks & functions/`

#### Advanced Dictionary Operations
```python
# Nested dictionary
main_dict = {
    "hassu123@gmail.com": {
        "name": "Hassaan",
        "password": "hassu123"
    },
    "ahmed123@gmail.com": {
        "name": "Ahmed",
        "password": "fastfast"
    }
}
```

#### User Registration & Login System
```python
global_user = []

def Register(name, email, password):
    global_user.append(name)
    global_user.append(email)
    global_user.append(password)

def login(email, password):
    if global_user[1] == email and global_user[2] == password:
        print(f"Welcome {global_user[0]}")
    else:
        print("Not Registered!")
```

---

### 7. Classes & Object-Oriented Programming
**File:** `Classes & tasks/`

#### Class Basics
```python
class cars():
    def __init__(self, color, model, make_year):
        self.color = color
        self.model = model
        self.make_year = make_year

    def start(self):
        print("Car started")

    def stop(self):
        print("Car stopped")

# Object creation
civic = cars('Black', 'Honda', 2025)
```

#### Class Variables & Static Methods
```python
class saylani():
    helpline = '09000000'  # Class variable (static)
    obj_count = 0          # Dynamic counter

    def __init__(self, campus, staff_count, course):
        self.campus = campus
        self.staff_count = staff_count
        self.course = course
        saylani.obj_count += 1

    @staticmethod
    def facilities():
        print("Medical also available")
```

---

### 8. Lambda Functions
**File:** `Lambda Functions/Lambda Functions.ipynb`

#### Lambda Syntax
```python
# Basic lambda
lambda x, y: x + y

# Assigned to variable
f = lambda x, y: x * y
f(5, 8)  # Returns 40
```

#### Lambda with Built-in Functions

| Function | Description |
|----------|-------------|
| `map()` | Apply function to all items |
| `filter()` | Filter items based on condition |
| `reduce()` | Reduce to single value |
| `any()` | Check if any element is True |
| `all()` | Check if all elements are True |

```python
# Map example
list(map(lambda x: x**2, range(1, 15)))

# Filter example
list(filter(lambda x: x % 2 == 0, range(1, 41)))

# Reduce example
from functools import reduce
reduce(lambda x, y: x * y, [5, 8, 31, 81])
```

#### Conditional Lambda
```python
criteria = lambda marks: "pass" if marks > 50 else "fail"
```

---

### 9. OOP: Inheritance, Abstraction & Data Files
**File:** `oop inherit abstract data files/`

#### Inheritance
```python
class Parents():
    def __init__(self, eye_color, hair_color):
        self.eye_color = eye_color
        self.hair_color = hair_color

    def can_paint(self):
        print("Can paint")

class Child(Parents):
    def __init__(self, eye_color, hair_color, skin_color):
        super().__init__(eye_color, hair_color)
        self.skin_color = skin_color
```

#### Multiple Inheritance
```python
class Father():
    def __init__(self, height, health):
        self.height = height
        self.health = health

class Mother():
    def __init__(self, beauty, cooking):
        self.beauty = beauty
        self.cooking = cooking

class Child(Father, Mother):
    def __init__(self, health, height, knowledge, wealth, beauty, cooking):
        Father.__init__(self, height, health)
        Mother.__init__(self, beauty, cooking)
```

#### Abstraction
```python
class shapes():
    def sides(self):
        pass  # Abstract method

class square(shapes):
    def sides(self):
        print("Square has 4 sides")

class Circle(shapes):
    def sides(self):
        print("Circle has no sides")
```

#### Polymorphism
```python
class Animal:
    def speak(self):
        return "Animal Speaks"

class Dog(Animal):
    def speak(self):
        return "woof"

class Cat(Animal):
    def speak(self):
        return "Meow"
```

#### Encapsulation
```python
class saylani():
    def __init__(self):
        self.helpline = "786"      # Public
        self._batch = "Python"      # Protected (single underscore)
        self.__result = "70%"       # Private (double underscore)
```

#### File Handling
```python
# Write to file
with open('file.txt', 'w') as f:
    f.write('Content here')

# Read from file
with open('file.txt', 'r') as f:
    content = f.read()

# Append to file
with open('file.txt', 'a') as f:
    f.write('Additional content')
```

---

### 10. OOP: Overriding & Overloading
**File:** `oop over riding & loading/oop over riding & loading.ipynb`

#### Method Overriding
```python
class Animal():
    def eating(self):
        print("Animals can eat")

class Birds():
    def eating(self):
        print("Birds can eat")
```

#### Method Overloading
```python
from typing import overload

class Adder():
    @overload
    def add(self, x: int, y: int) -> int: ...

    @overload
    def add(self, x: float, y: float) -> float: ...

    @overload
    def add(self, x: str, y: str) -> str: ...

    def add(self, x, y):
        if isinstance(x, int) and isinstance(y, int):
            return x + y
        elif isinstance(x, float) and isinstance(y, float):
            return x + y
        elif isinstance(x, str) and isinstance(y, str):
            return x + y
```

---

### 11. File Handling: CSV, JSON & Error Handling
**File:** `file handling/file handling(csv,json,error).ipynb`

#### CSV File Operations
```python
import csv

# Read CSV
with open("competition.csv", 'r') as f:
    content = csv.reader(f)
    for line in content:
        print(line)

# Write to CSV
with open('competition.csv', mode='a', newline="") as f:
    writer = csv.writer(f, delimiter=",")
    writer.writerows([["2019", "World Cup", "England"]])
```

#### JSON File Operations
```python
import json

# Write JSON
with open('json_file.json', 'w') as f:
    json.dump(['a', 'b', 'c'], f)

# Read JSON
with open('data_file.json', 'r') as f:
    data = json.load(f)
```

#### Error Handling
```python
try:
    calculation = 5 / 0
except ZeroDivisionError as e:
    print(e)
finally:
    print("Completed")
```

---

### 12. NumPy & Matplotlib
**File:** `Numpy Matplotlib/Numpy Matplotlib.ipynb`

#### NumPy Basics
```python
import numpy as np

# Create arrays
weight_np = np.array([40.5, 77, 49.1, 64, 55.8])
arr_2d = np.array([[1, 2, 3], [4, 5, 6]])
identity_matrix = np.eye(3)
filled_array = np.full((3, 3), 1)

# Array operations
bmi = weight_np / (height_np ** 2)

# Statistics
np.mean(np_city)    # Mean
np.median(np_city)  # Median
np.argmax(arr)      # Index of max value
np.argmin(arr)      # Index of min value
```

#### Filtering with np.where()
```python
np.where(height_np > 5, True, False)
np.where(weight_np > 60, weight_np, weight_np / 100)
```

#### Matplotlib Visualizations
```python
import matplotlib.pyplot as plt

# Line Plot
plt.plot(year, population)
plt.xlabel("Years")
plt.ylabel("Population")
plt.title("Population Growth")
plt.show()

# Scatter Plot
plt.scatter(gdp_cap, life_exp)
plt.xscale('log')
plt.show()

# Bar Chart
plt.bar(year, population)
plt.show()

# Histogram
plt.hist(values, bins=3)
plt.show()
```

---

### 13. Pandas & Matplotlib
**File:** `pandas matplotlib/pandas.ipynb`

#### DataFrame Operations
```python
import pandas as pd

# Read CSV
df = pd.read_csv("gapminder.csv")
titanic = pd.read_csv("titanic.csv")

# View data
df.head(10)
df.shape
df.isna().sum()

# Select columns
country = df['country']
df[['country', 'capital']]

# Set index
df_index = df.set_index('Name')
df_index.reset_index(drop=True)
```

#### Data Analysis
```python
# Pivot table
titanic.pivot_table(values='Age', index='Sex', columns='Survived',
                    fill_value=0, aggfunc='count')

# Group by
gender_count = titanic.groupby('Sex')['Age'].count()

# Filtering
titanic[titanic['Sex'] == 'female']['Fare'].hist()
```

#### Data Visualization with Pandas
```python
# Bar chart
gender_count.plot(kind='bar')

# Line plot
ten_ages.plot(kind='line')

# Scatter plot
titanic.plot(x='Age', y='PassengerId', kind='scatter')

# Histogram
titanic['Age'].hist(bins=20)
```

---

## Supporting Data Files

| File | Description |
|------|-------------|
| `file handling/competition.csv` | Sample CSV data for practice |
| `file handling/json_file.json` | JSON file for practice |
| `file handling/data_file.json` | Sample JSON data |
| `pandas matplotlib/gapminder.csv` | World development data |
| `pandas matplotlib/bricks.csv` | BRICS countries data |
| `pandas matplotlib/titanic.csv` | Titanic passenger dataset |
| `oop inherit abstract data files/module.py` | Python module example |
| `oop inherit abstract data files/file.txt` | Text file for file handling |

---

## Key Concepts Summary

### Python Fundamentals
- Variables and Data Types
- Operators (Arithmetic, Comparison, Logical)
- String Operations and Slicing
- Control Flow (if/elif/else)

### Data Structures
- Lists, Tuples, Sets
- Dictionaries and their methods
- List/Dict Comprehensions

### Loops & Functions
- For and While loops
- Function definitions and parameters
- *args and **kwargs
- Recursion

### Object-Oriented Programming
- Classes and Objects
- Inheritance (Single, Multiple)
- Polymorphism
- Abstraction
- Encapsulation
- Method Overriding & Overloading

### Data Analysis
- NumPy arrays and operations
- Pandas DataFrames
- Data visualization with Matplotlib
- File handling (CSV, JSON)

---

## Author

**Muhammad Hassaan**

---

## Course

**Cloud Data Engineering - Batch 03**