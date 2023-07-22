require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>Dice Roll</h1>
    <h2>2d6</h2>
   <p>#{outcome}</p>
   <a href='/'>Home</a>
   <a href='/dice/2/6'>Reroll</a>"
end

get("/dice/2/10") {
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>Dice Roll</h1>
    <h2>2d10</h2>
   <p>#{outcome}</p>
   <a href='/'>Home</a>
   <a href='/dice/2/10'>Reroll</a>"
}



get("/dice/1/20") {
  die = rand(1..20)
  outcome = "You rolled a #{die}."

  "<h1>Dice Roll</h1>
    <h2>1d20</h2>
   <p>#{outcome}</p>
   <a href='/'>Home</a>
   <a href='/dice/1/20'>Reroll</a>"
}


get("/dice/5/4") {
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
	
  outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and a #{fifth_die} for a total of #{sum}."
	
  "<h1>Dice Roll</h1>
    <h2>5d4</h2>
   <p>#{outcome}</p>
   <a href='/'>Home</a>
   <a href='/dice/5/4'>Reroll</a>"
}
