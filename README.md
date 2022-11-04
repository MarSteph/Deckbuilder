# Deckbuilder

### Deckbuilder API for Magic: The Gathering  

This is a deck building API project for Magic: the Gathering. It is used to keep track of cards and decks for players that are registered in the database.
Each player has an account that is connected to a password, email, and username. Players can add cards to their collection and store them in a decklist.
The database can also keep track of the sets that each card belongs to.

| ------ | index   | show             | create  | delete           | update           | cards_in_deck               | add_card                | delete_card           |
| ------ | ------- | ----             | ------  | ------           | -------          | ------------                | ------------------------|-----------------------|
| method | GET     | GET              | POST    | DELETE           | PUT              | GET                         | POST                    | DELETE                |
|endpoint|/accounts|/accounts/<int:id>|/accounts|/accounts/<int:id>|/accounts/<int:id>| N/A                         | N/A                     | N/A                   |
|endpoint|/decks   |/decks/<int:id>   |/decks   |/decks/<int:id>   |/decks/<int:id>   |/decks/<int:id>/cards_in_deck|/decks/<int:id>/new_cards|/decks/<int:deck_id>/  |
|        |         |                  |         |                  |                  |                             |                         |new_cards/<int:card_id>|
|endpoint|/cards   |/cards/<int:id>   |/cards   |/cards/<int:id>   |/cards/<int:id>   | N/A                         | N/A                     | N/A                   |
|endpoint|/players |/players/<int:id> |/players |/players/<int:id> |/players/<int:id> | N/A                         | N/A                     | N/A                   |
|endpoint|/sets    |/sets/<int:id>    |/sets    |/sets/<int:id>    |/sets/<int:id>    | N/A                         | N/A                     | N/A                   |

| ------ | enchantments                | sorceries                       | instants                       | lands                   | artifacts      | creatures      |
| ------ | -------                     |---------------------------------|--------------------------------|-------------------------|----------------|----------------|
| method | GET                         | GET                             | GET                            | GET                     | GET            | GET            |
|endpoint|/cards/enchantments          |/cards/sorceries                 |/cards/instants                 |/cards/lands             |/cards/artifacts|/cards/creatures|

| ------ | lands_in_deck               | sorceries_in_deck               | instants_in_deck               | sorceries_in_deck               |     
| ------ | -------                     | ----                            | ------                         | ------                          |
| method | GET                         | GET                             | GET                            | GET                             |
|endpoint|/decks/<int:id>/lands_in_deck|/decks/<int:id>/sorceries_in_deck|/decks/<int:id>/instants_in_deck|/decks/<int:id>/sorceries_in_deck|  


| ------ | enchantments_in_deck               |  artifacts_in_deck              |            
| ------ | -------                            | ----                            | 
| method | GET                                | GET                             |
|endpoint|/decks/<int:id>/enchantments_in_deck|/decks/<int:id>/artifacts_in_deck|


1. Over time, I realized that there were some problems with my initial design. I initially set up the card names to be unique, but when I considered the endpoints I wanted to implement, I realized that I needed to change this so that a player could have more than one card with the same name in a deck. I also realized that the Deck entity doesn't need to have a size because you can query the count of the cards to get the size of the deck.

2. I chose to use an ORM because I wanted to focus on writing the Python code, and the queries that I wanted to implement were simple enough that I wouldn't need to use raw SQL.

3. I plan to improve the API by adding more endpoints to get more categorical results. I want to implement endpoints that show all cards with a certain rarity, color identity, and converted mana cost. These can be used for deck stats, as well as the average converted mana cost in a deck, and percentages for card type, color, and rarity.


