# == Schema Information
#
# Table name: cats
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  breed       :string
#
# Table name: toys
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  price       :integer
#
# Table name: cat_toys
#
#  id          :integer      not null, primary key
#  cat_id      :integer      not null, foriegn key
#  toy_id      :integer      not null, foreign key

require_relative '../data/pg_helper.rb'

def gold_cat_toys
  # Find all the toys that are `Gold` in color and have more than one word in
  # the name.

  # Sort the toys by name alphabetically.

  execute(<<-SQL)
      SELECT name
      FROM toys
      WHERE color = 'Gold' AND name LIKE '% %'
      ORDER BY name ASC
  SQL
end

def extra_jet_toys
  # `Jet` the cat has a ton of toys! 
  # Find all of Jet's toys that have the same name, and the number of toys 
  # with the same name.
  # Sort the toys by name alphabetically.

  execute(<<-SQL)
    SELECT toys.name, count(*) AS num_toys 
    FROM toys
      JOIN cat_toys ON toys.id = cat_toys.toy_id
      JOIN cats ON cat_toys.cat_id = cats.id
    WHERE cats.name = 'Jet'
    GROUP BY toys.name
    HAVING count(*) > 1
    ORDER BY toys.name
  SQL
end


def cats_with_a_lot
  # Find the names of all cats with more than 7 toys.
  # Sort the cats by cat name alphabetically.

  execute(<<-SQL)
    SELECT cats.name
    FROM toys
      JOIN cat_toys ON toys.id = cat_toys.toy_id
      JOIN cats ON cat_toys.cat_id = cats.id
    GROUP BY cats.id 
    HAVING count(*) > 7
    ORDER BY cats.name 
  SQL
end

def just_like_orange
  # Find the breed of the cat named `Orange`.
  # Then list the cats names and the breed of all the cats of Orange's breed.
  # Exclude the cat named `Orange` from your results.
  # Order by cats name alphabetically.

  execute(<<-SQL)
    SELECT cats.name, cats.breed
    FROM cats
    WHERE cats.breed = (
        SELECT breed
        FROM cats
        WHERE name = 'Orange'
    ) AND cats.name != 'Orange'
    ORDER BY name
  SQL
end

def expensive_tastes
  # Find the most expensive `Tiger` toy.
  # Find all the cats that own that specific toy.
  # List the name of the cat, name of the toy, and color of the toy.
  # Sort by cat name alphabetically.
 
  execute(<<-SQL)
    SELECT cats.name, toys.name, toys.color 
    FROM toys
      JOIN cat_toys ON toys.id = cat_toys.toy_id
      JOIN cats ON cat_toys.cat_id = cats.id
    WHERE toys.name = 'Tiger' AND toys.price = (
        SELECT toys.price
        FROM toys
        WHERE toys.name = 'Tiger'
        ORDER BY toys.price DESC
        LIMIT 1
    )
    ORDER BY cats.name 




  SQL
end

