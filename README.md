# Karen

[Karen](https://spongebob.fandom.com/wiki/Karen_Plankton) is a general usage Discord bot. She isn't meant to do anything in 
particular. She exists mostly as programming practice and because why the heck
not.

## Installation
Clone the repo.  
Create `config/config.exs` ([example](#Example-Config) below)  
Enter the bot's token in `config/config.exs`.  
Get dependencies with `mix deps.get`.  
Run the application.

## Example Config
`config/config.exs`
```elixir
import Config
  config :nostrum,
    token: "123abc",  # Bot token
    num_shards: :auto # Number of shards to run the bot under, or `:auto`
```

## Features
Coming soon!™

## TODO
* Provide bot token via environment variable.
* Build out commands.
* Use Elixir's Releases for updates and deployment.
