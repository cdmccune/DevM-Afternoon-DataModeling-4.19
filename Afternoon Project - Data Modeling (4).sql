CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "password" varchar(40),
  "email" varchar(40),
  "first_name" varchar(40),
  "last_name" varchar(40)
);

CREATE TABLE "recipes" (
  "recipe_id" SERIAL PRIMARY KEY,
  "author_id" INT NOT NULL references users (user_id),
  "ispublic" BOOLEAN,
  "recipe_instruction" varchar(250)
);

CREATE TABLE "ingredients" (
  "ingredient_id" SERIAL PRIMARY KEY,
  "recipe_id" INT NOT NULL references recipes(recipe_id),
  "ingredient_name" varchar(30),
  "quantity" NUMERIC
);

CREATE TABLE "occasions" (
  "occasion_id" SERIAL PRIMARY KEY,
  "occasion_name" varchar(30),
  "host_id" INT NOT NULL references users (user_id)
);

CREATE TABLE "grocerylist" (
  "grocery_list_id" SERIAL PRIMARY KEY,
  "user_id" INT NOT NULL references users (user_id)
);

CREATE TABLE "grocerylistingredients" (
  "grocery_list_ingredient_id" SERIAL PRIMARY KEY,
  "ingredient_id" INT NOT NULL references ingredients (ingredient_id),
  "grocery_list_id" INT NOT NULL references grocerylist (grocery_list_id)
);

CREATE TABLE "occasionrecipe" (
  "occasion_recipe_id" SERIAL PRIMARY KEY,
  "occasion_id" INT NOT NULL references occasions(occasion_id),
  "recipe_id" INT NOT NULL references recipes(recipe_id)
);