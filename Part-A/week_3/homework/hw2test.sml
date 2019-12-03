(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw2solution.sml";

val all_except_option1 = all_except_option ("string", ["string"]) = SOME []
val all_except_option2 = all_except_option ("string", []) = NONE
val all_except_option3 = all_except_option ("string", ["string", "foo", "bar"]) = SOME ["foo", "bar"]
val all_except_option4 = all_except_option ("string", ["foo", "string", "bar"]) = SOME ["foo", "bar"]
val all_except_option5 = all_except_option ("string", ["foo", "bar", "string"]) = SOME ["foo", "bar"]
val all_except_option6 = all_except_option ("string", ["foo", "bar", "baz"]) = NONE


val get_substitutions11 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val get_substitutions12 = get_substitutions2 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val get_substitutions13 = get_substitutions2 ([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]
val get_substitutions14 = get_substitutions2 ([["foo", "bar"],["there"]], "foo") = ["bar"]
val get_substitutions15 = get_substitutions2 ([["foo"],["there"],["foo"]], "foo") = []
val get_substitutions16 = get_substitutions2 ([["foo"],["there"],["foo", "bar"]], "foo") = ["bar"]


val similar_names1 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]
val similar_names2 = similar_names ([["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]
val similar_names3 = similar_names ([["Elizabeth","Betty"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}]
		

val card_color1 = card_color (Clubs, Num 2) = Black
val card_color2 = card_color (Diamonds, Queen) = Red
val card_color3 = card_color (Spades, Ace) = Black


val card_value1 = card_value (Clubs, Num 2) = 2
val card_value2 = card_value (Hearts, Ace) = 11
val card_value3 = card_value (Spades, Queen) = 10
val card_value4 = card_value (Diamonds, Num 8) = 8


val remove_card1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val remove_card2 = (remove_card ([(Hearts, Ace)], (Hearts, Num 5), IllegalMove); false)
										handle IllegalMove => true
val remove_card3 = remove_card ([(Diamonds,Jack),(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Diamonds,Jack)]
val remove_card4 = remove_card ([(Diamonds,Jack),(Hearts, Ace),(Hearts,King),(Clubs,Num 6),(Hearts,Ace)], (Hearts, Ace), IllegalMove) =
						[(Diamonds,Jack),(Hearts,King),(Clubs,Num 6),(Hearts,Ace)]
val remove_card5 = remove_card ([(Hearts, Num 8)], (Hearts, Num 8), IllegalMove) = []
val remove_card6 = remove_card ([(Clubs,Ace),(Clubs,Ace)], (Clubs,Ace), IllegalMove) = [(Clubs,Ace)]


val all_same_color1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val all_same_color2 = all_same_color [(Hearts, Ace), (Hearts, Ace), (Hearts, Ace)] = true
val all_same_color3 = all_same_color [(Hearts, Ace), (Hearts, Ace), (Diamonds, Ace)] = true
val all_same_color4 = all_same_color [(Hearts, Ace), (Hearts, Ace), (Clubs, King), (Diamonds, Ace)] = false


val sum_cards1 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val sum_cards2 = sum_cards [(Diamonds, Num 8)] = 8
val sum_cards3 = sum_cards [(Hearts, Num 2),(Clubs, Ace), (Hearts, Queen)] = 23


val score1 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val score2 = score ([(Hearts, Num 2),(Clubs, Num 4),(Spades,Ace)],10) = 21
val score3 = score ([(Clubs, Num 2),(Clubs, Num 4),(Spades,Ace)],10) = 10
val score5 = score ([(Hearts,King)],10) = 0
val score6 = score ([(Hearts,Num 3)],10) = 3


val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3
			 
val test13 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Hearts,Ace)],
                        [Draw,Draw,Discard(Spades,Ace),Draw,Discard(Clubs,Ace),Draw],
                        42)
             = 20	

val test14 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
             
