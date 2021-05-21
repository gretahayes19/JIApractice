# W5D5

Let's start off with the usual:

- Greatest achievements this week? What are you proud of?
- Greatest challenge?

# Assessment
- Practice is live
- Office hours tomorrow (12-4)
- Do the practice at least 5 times!
- Take the practice in FULL at least once tonight so you can come to office tomorrow with context
- ActiveRecord queries will use the same DB as movie buff
- Associations will be explained in the README.
- Recommend sections in the following order
  - Migrations
  - Associations
  - SQL
  - ActiveRecord
- Migrations and associations have the most points/min so these are best to start with.
- Show students how to fix their migrations portion if they screw it up
  - Delete migrations folder
  - Copy contents of `schema copy.rb` into `schema.rb`
  - Run `./setup_db.sh`
- 

## Core Concepts

- Includes vs Joins

-

## Learning Goals

### Movie Buff

- Be able to write complicated ActiveRecord queries
  - Become familiar with more of ActiveRecord's functionalities
- Know how to test and debug ActiveRecord queries

### Polls

- Be able to write migrations with indices and constraints
  - Know how to fix the effects of incorrect migrations
- Be able to write associations
- Know how to seed a project's database
- Be able to write custom validations in the model
- Be able to solve the N+1 query problem

## Discussion

- Students write and test more advanced ActiveRecord queries in the movie buff project
  - Manually test queries by running the code in the Rails console
  - Chain `.to_sql` on the end of queries to inspect the SQL query that ActiveRecord makes under the hood
- Students write their own migrations and models in the polls app project
  - Show students the schema and the seed file, to summarize what the database looks like and what we're putting into it
  - Walk through what's going on in each of the models
    - `presence` and `uniqueness` validations (Rails 5 automatically validates the presence of `belongs_to` associations)
    - Review the steps for the custom validation `not_duplicate_response` in `response.rb`
      - `Response#sibling_responses` gives us all other responses besides our own to the question being asked
      - `Response#respondent_already_answered?` uses `sibling_responses` to see if the current answerer has already answered this question
      - `Response#not_duplicate_response` takes care of introducing the error if the respondent had already responded
  - Poll results in `question.rb` is first written with an N + 1 query
    - Get all `answer_choices` for a question, then call `responses.count` for each
    - Next use `includes` to pre-fetch at the same time as the `answer_choices` for two SQL queries instead
    - Finally improve code to the solution by transferring only the number of responses to the client, not the entire responses themselves




