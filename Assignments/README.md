# Cloud Data Engineering - Assignments

This repository contains Python programming assignments and Exploratory Data Analysis (EDA) projects completed as part of the Cloud Data Engineering course (Batch-3).

## Author
**Muhammad Hassaan**


---

## Table of Contents

### Python Basics

| # | Notebook | Description |
|---|----------|-------------|
| 1 | [Variables & Conditional Statements](Variables%20%26%20Conditional%20Statements%20.ipynb) | Variables, operators, if-else statements, grading system, leap year checker |
| 2 | [Strings](Strings%20.ipynb) | String manipulation, palindrome checker, password validation |
| 3 | [Loops](Loops%20.ipynb) | For/while loops, arithmetic/geometric sequences, factorial, power calculation |
| 4 | [Lists](Lists%20.ipynb) | List operations, matrix operations, string processing |
| 5 | [Class](Class.ipynb) | OOP concepts - Circle, Person, Calculator classes |

### Exploratory Data Analysis (EDA)

| # | Notebook | Dataset | Description |
|---|----------|---------|-------------|
| 6 | [EDA 07 - Netflix](Assignmnet_(EDA%20)_07.ipynb) | Netflix Movies | Analysis of movie duration trends over time |
| 7 | [EDA 08 - Google Play Store](Assignment_(EDA)_08.ipynb) | Android Apps | App market analysis: categories, ratings, pricing, sentiment |
| 8 | [EDA 09 - Scala GitHub](Assignment_(EDA)_09.ipynb) | GitHub Pull Requests | Open source project contribution analysis |

---

## Detailed Content

### 1. Variables & Conditional Statements
**Topics Covered:**
- Variable declaration and data types
- Arithmetic, comparison, and logical operators
- If-else conditional statements
- Grade calculator system
- Electricity bill calculator
- Leap year checker
- Voting eligibility checker
- Age comparison program

### 2. Strings
**Topics Covered:**
- Vowel counting in strings
- Character type analysis (uppercase, lowercase, digits, whitespace)
- String reversal and manipulation
- First/last character exchange
- String shifting operations
- Palindrome detection
- Password validation (length, uppercase, lowercase, digit requirements)

### 3. Loops
**Topics Covered:**
- For and while loops
- Number sequences (1-10, countdown)
- Even/odd number printing
- Multiplication tables
- Arithmetic progression
- Geometric sequence
- Sum of numbers and reciprocals
- Factorial calculation
- Power calculation without `**` operator

### 4. Lists
**Topics Covered:**
- List creation and manipulation
- Alternate element extraction
- List reversal without `reverse()` method
- Finding maximum element without `max()` function
- List rotation
- Word deletion from strings
- Date format conversion
- Word capitalization
- Matrix row sum calculation
- Matrix addition and multiplication

### 5. Class (Object-Oriented Programming)
**Topics Covered:**
- Class definition and instantiation
- Constructor (`__init__` method)
- Instance methods
- **Circle Class:** Area and perimeter calculation using `math.pi`
- **Person Class:** Name, country, date of birth with age calculation using `datetime`
- **Calculator Class:** Basic arithmetic operations (add, subtract, multiply, divide)

---

### 6. EDA 07 - Netflix Movie Duration Analysis
**Dataset:** Netflix movies and shows data

**Analysis Performed:**
1. Creating DataFrames from dictionaries
2. Data visualization with matplotlib (line plots, scatter plots)
3. Loading and filtering CSV data
4. Filtering movies from TV shows
5. Identifying short films by genre (Children, Documentaries, Stand-Up)
6. Color-coded scatter plots by genre
7. Trend analysis of movie durations over time

**Key Findings:**
- Movie durations have been declining over the years
- Non-typical genres (Children's movies, Documentaries, Stand-Up) tend to be shorter

---

### 7. EDA 08 - Google Play Store Apps Analysis
**Dataset:**
- `apps.csv` - App details (13 features)
- `user_reviews.csv` - User reviews with sentiment analysis

**Analysis Performed:**
1. Data loading and duplicate removal
2. Data cleaning (removing special characters from Installs and Price)
3. Data type conversion
4. Category distribution analysis
5. App rating distribution
6. Size vs Rating correlation
7. Price vs Rating analysis for paid apps
8. Pricing trends across categories
9. Junk app filtering (apps > $200)
10. Sentiment analysis (free vs paid apps)

**Key Findings:**
- Family and Game apps dominate the market
- Average app rating is ~4.17
- Most top-rated apps are between 2-20 MB
- Medical and Family apps are the most expensive categories
- Paid apps have higher sentiment polarity than free apps

---

### 8. EDA 09 - Scala GitHub Repository Analysis
**Dataset:**
- `pulls_2011-2013.csv` - Pull requests 2011-2013
- `pulls_2014-2018.csv` - Pull requests 2014-2018
- `pull_files.csv` - Files modified in each PR

**Analysis Performed:**
1. Loading and combining multiple CSV files
2. Date conversion to datetime objects
3. DataFrame merging operations
4. Project activity analysis (monthly/yearly PR counts)
5. Contributor distribution analysis
6. Recent file change identification
7. Top contributor identification by file
8. Developer contribution trends over time
9. File-level contribution visualization

**Key Findings:**
- Analysis of Scala language open-source contributions
- Identification of key contributors for specific files
- Understanding project activity trends over years

---

## Libraries Used

| Library | Purpose |
|---------|---------|
| `pandas` | Data manipulation and analysis |
| `numpy` | Numerical operations |
| `matplotlib` | Data visualization |
| `seaborn` | Statistical visualization |
| `plotly` | Interactive visualizations |
| `datetime` | Date and time operations |
| `math` | Mathematical operations |

---

## How to Run

1. Clone this repository
2. Ensure you have Python 3.x installed
3. Install required packages:
   ```bash
   pip install pandas numpy matplotlib seaborn plotly
   ```
4. Open Jupyter Notebook or JupyterLab
5. Navigate to the assignment you want to run
6. For EDA assignments, ensure the `datasets/` folder with required CSV files is present

---

## Dataset Structure

For EDA assignments, datasets should be organized as:
```
Assignments/
├── datasets/
│   ├── apps.csv
│   ├── user_reviews.csv
│   ├── netflix_data.csv
│   ├── pulls_2011-2013.csv
│   ├── pulls_2014-2018.csv
│   └── pull_files.csv
```

---

## Course Information
- **Course:** Cloud Data Engineering
- **Batch:** 3
- **Institution:** Saylani Mass IT Training