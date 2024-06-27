extends Node

const DEFAULT_NUMBER_OF_SIDES: int = 6

var number_of_rows = 6
var number_of_columns = 6

enum CELL_STATISTIC_ENUM {
	DEPILATION,
	SING_SONG,
	ROLE,
	GUESS_OR_DRINK,
	MAKE_UP,
	HUG,
	FIFTY_FIFTY,
	HEADPHONES,
	THURH_OR_DARE,
	SKIP,
	DAP,
	SHOT_2,
	NAILS,
	RIGHT_PERSON,
	CRAZY_COCKAIL,
	YOGA_CHALLANGE,
	SHOT_3,
	NEVER_HAVE_I_EVER,
	PLACEMENT,
	REROLL,
	TRUTH_2_LIE_1,
	NEXT_X_2,
	INSTA,
	LEFT_PERSON,
	CLOTHES,
	GALLEY,
	SHOT_1,
	ICE,
	TWERK,
	PHONE,
	EGGS,
	SHOT_2_2,
	DICE_RULE,
	JUST_DANCE,
	JOKE,
	SAVE
}

var CELL_STATISTICS = {
	CELL_STATISTIC_ENUM.DEPILATION: Cell_Statistic.new('Depelation!', 'Depilate your legs or drink 1 shot'),
	CELL_STATISTIC_ENUM.SING_SONG: Cell_Statistic.new('Sing a song!', 'You need to sing a song that your friends choose!'),
	CELL_STATISTIC_ENUM.ROLE: Cell_Statistic.new('Party leader!', 'Your responsibility is to participate in other players tasks 
																	as a third party, if necessary. Party leader is also allowed
																	 to do any task instead of player if player chose to skip task.
																	 If leader had chose to do it and did, then player drinks x2! '),
	CELL_STATISTIC_ENUM.GUESS_OR_DRINK: Cell_Statistic.new('Crocodile!', 'We are playing crocodile! Your need to guess given word!'),
	CELL_STATISTIC_ENUM.MAKE_UP: Cell_Statistic.new('Make up!', 'You will get makeup done without the ability to influence the process'),
	CELL_STATISTIC_ENUM.HUG: Cell_Statistic.new('Hug', 'Hug <<someone>>'),
	CELL_STATISTIC_ENUM.FIFTY_FIFTY: Cell_Statistic.new('50/50', 'Heads and tails are being played. You choose the side of the coin!'),
	CELL_STATISTIC_ENUM.HEADPHONES: Cell_Statistic.new('Headphones', 'You put on headphones with music and try to understand what is being said to you!'),
	CELL_STATISTIC_ENUM.THURH_OR_DARE: Cell_Statistic.new('Thuth or dare!', 'We are playing truth or dare!'),
	CELL_STATISTIC_ENUM.SKIP: Cell_Statistic.new('Skip', 'You are skipping task!'),
	CELL_STATISTIC_ENUM.DAP: Cell_Statistic.new('DAP', '<<description>> I forget what is it(( I will describe this later...'),
	CELL_STATISTIC_ENUM.SHOT_2: Cell_Statistic.new('2 SHOTS!!!', 'You are drinking 2 shots!'),
	CELL_STATISTIC_ENUM.NAILS: Cell_Statistic.new('Nails', 'You will get a manicure by painting your nails with varnish!'),
	CELL_STATISTIC_ENUM.RIGHT_PERSON: Cell_Statistic.new('Right person ...', 'You will do ... for right person'),
	CELL_STATISTIC_ENUM.CRAZY_COCKAIL: Cell_Statistic.new('Crazy coctail!', 'You will have to drink a cocktail that will be made from everything
																	 that comes to hand.'),
	CELL_STATISTIC_ENUM.YOGA_CHALLANGE: Cell_Statistic.new('Yoga challenge', '<<Twister or||or yoga with person>>'),
	CELL_STATISTIC_ENUM.SHOT_3: Cell_Statistic.new('3 SHOTS!!!', 'You are drinking 3 shots!'),
	CELL_STATISTIC_ENUM.NEVER_HAVE_I_EVER: Cell_Statistic.new('Never have I ever', 'Simple game "Never have I ever"'),
	CELL_STATISTIC_ENUM.PLACEMENT: Cell_Statistic.new('Placement', 'Changing places!'),
	CELL_STATISTIC_ENUM.REROLL: Cell_Statistic.new('Reroll', 'Oops... reroll the dice'),
	CELL_STATISTIC_ENUM.TRUTH_2_LIE_1: Cell_Statistic.new('2 Truth 1 Lie', 'You need to say 2 truthes and 1 lie. 
																	If <<other player>> guesses what is lie - youd drink!'),
	CELL_STATISTIC_ENUM.NEXT_X_2: Cell_Statistic.new('Next x2', 'Next task and punishment are x2'),
	CELL_STATISTIC_ENUM.INSTA: Cell_Statistic.new('Insta', 'You need to post some cringe stories on your profile'),
	CELL_STATISTIC_ENUM.LEFT_PERSON: Cell_Statistic.new('Left person', 'You will do <<something>> for right person'),
	CELL_STATISTIC_ENUM.CLOTHES: Cell_Statistic.new('Clothes swap', 'Your need to swap clothes with <<someone>>'),
	CELL_STATISTIC_ENUM.GALLEY: Cell_Statistic.new('Galley', 'You need to post show <<some>> pictures on your galley to <<someone(s?)>>'),
	CELL_STATISTIC_ENUM.SHOT_1: Cell_Statistic.new('2 SHOTS!!!', 'You are drinking 2 shot!'),
	CELL_STATISTIC_ENUM.ICE: Cell_Statistic.new('Ice', 'You should pour cold water on yourself.'),
	CELL_STATISTIC_ENUM.TWERK: Cell_Statistic.new('Twerk', 'Cmon babe! Twerk! Twerk! Twerk!'),
	CELL_STATISTIC_ENUM.PHONE: Cell_Statistic.new('Phone', '<<someone>> chose from your phone a contact and you will call him and say <<something>>'),
	CELL_STATISTIC_ENUM.EGGS: Cell_Statistic.new('Eggs', 'You need to eat a raw egg'),
	CELL_STATISTIC_ENUM.SHOT_2_2: Cell_Statistic.new('1 SHOT!!!', 'You are drinking 1 shots!'),
	CELL_STATISTIC_ENUM.DICE_RULE: Cell_Statistic.new('Dice rule', 'Reverse dice! Rows now are columns and columns now are rows!'),
	CELL_STATISTIC_ENUM.JUST_DANCE: Cell_Statistic.new('Just Dance', 'Literally... Just Dance!'),
	CELL_STATISTIC_ENUM.JOKE: Cell_Statistic.new('Joke', 'You are telling the joke! If noone laugh -> you drink. Other way drinks who laughed'),
	CELL_STATISTIC_ENUM.SAVE: Cell_Statistic.new('SAVE', 'You are skipping task!'),
	
}

func CREATE_CELL_WITH_STATISTIC(cell_type: int) -> Cell_Statistic:
	return CELL_STATISTICS[cell_type] as Cell_Statistic

