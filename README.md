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





