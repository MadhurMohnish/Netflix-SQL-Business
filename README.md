![Logonetflix](https://github.com/user-attachments/assets/7af0d6b5-d5d4-4800-8197-0f0da5a306d3)

# Netflix Movies and TV Shows Analysis with SQL

## Overview

This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. Below, you'll find a detailed account of the project's objectives, dataset, schema, queries, findings, and conclusions.

---

## Objectives

The primary objectives of this project are:
- Analyze the distribution of content types (Movies vs. TV Shows).
- Identify the most common ratings for movies and TV shows.
- List and analyze content based on release years, countries, and durations.
- Explore and categorize content based on specific criteria and keywords.

---

## Dataset

The dataset used for this project is sourced from Kaggle:

- **[Netflix Movies Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)**

This dataset provides detailed information about Netflix's content, including titles, type (movie/TV show), director, cast, country, release year, duration, genres, and more.

---

## Database Schema

The dataset is stored in a table named `netflix`. The schema for the table is as follows:

```sql
DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix (
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```
---

## Findings and Conclusion

### Findings:
1. **Content Distribution**:
   - The dataset contains a diverse range of movies and TV shows with varying ratings and genres.

2. **Common Ratings**:
   - Insights into the most common ratings provide an understanding of the content's target audience.

3. **Geographical Insights**:
   - The top countries producing Netflix content and the average content releases by India highlight regional content distribution trends.

4. **Content Categorization**:
   - Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

---

### Conclusion:
This analysis provides a comprehensive view of Netflix's content and offers valuable insights for content strategy and decision-making. Understanding trends in content type, ratings, geographical production, and categorization can aid Netflix in tailoring its offerings to meet audience preferences and regional demands.

---


