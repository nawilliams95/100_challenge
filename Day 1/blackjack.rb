#A Balcjack game made using Ruby Classes

#==============
#Players
#==============

class Player 
    attr_accessor :name, :bank, :hand
    # attr_reader :hand
    def initialize name, bank
        @name = name
        @bank = bank
        @hand = []
    end
end 

# human_player = Player.new 'Karri', 100
# computer_player = Player.new 'Jack-Bot', 10000

#============
#Deck
#============

$deck = []

#===========
#Cards
#===========

class Cards
    attr_reader :face, :suit, :value 
    def initialize face, suit, value
        @face = face
        @suit = suit
        @value = value
    end
    def get_hand player 
        new_hand = Cards.new face, suit, value
        player.hand << new_hand
    end
    def empty_hand player
        player.hand = []
    end
end

#Symbols 
#--------------------
heart = "\u2665"
p heart.encode('utf-8')
club = "\u2663"
p club.encode('utf-8')
diamond = "\u2666"
p diamond.encode('utf-8')
spade = "\u2660"
p spade.encode('utf-8')
#-----------------------


$faces = [*(2..10), 'Jack', 'Queen', 'King', 'Ace']
$suits = [heart, diamond, club, spade]
def create_deck
    $faces.each do |face|
        if face.class == Integer 
            value = face
        elsif face == 'Ace'
            value = 11
        else 
            value = 10
        end
        $suits.each do |suit|
            $deck.push(Cards.new face, suit, value)
        end
    end 
end
 
# p create_deck

def shuffle_deck
    $deck.shuffle!
end
# p shuffle_deck

def deal num, player
    num.times {$deck.shift.get_hand(player)}
end

def hand_total player
    total = 0
    player.hand.each do |card|
        total += card.value
    end
    total
end

def empty_hand player
    player.hand = []
end

#=========================================
#Game Play
#=========================================

def start_game 
    puts 'Welcome to Ruby-Con Blackjack!...'
    sleep(2.5)
    puts 'Please enter your name to begin:'
    player_1 = Player.new gets.chomp, 100
    house = Player.new 'House', 10000
    create_deck
    shuffle_deck
    puts "Alrighty #{player_1.name} lets play!..."
    puts 'Are you ready? Yes (y) No (n)'
    answer = gets.chomp.downcase
    while answer == 'y'
        if player_1.bank > 0  && $deck.length > 5
            puts 'Dealing cards...'
            sleep(3)
            deal(2, player_1)
            puts "You now have #{player_1.hand[0].face} of #{player_1.hand[0].suit} "
            puts "You now have #{player_1.hand[1].face} #{player_1.hand[1].suit}"
            puts "Hand Value: #{hand_total player_1} "
            deal(2, house)
            sleep(3)
            puts "The #{house.name} has one card showing... "
            sleep(2.5)
            puts "#{house.name} Cards: #{house.hand[0].face} of #{house.hand[0].suit}"
            puts 'Would you like to Hit (h) or Stand (s)?'
            hit = gets.chomp.downcase
            if hit == 'h'
                deal(1, player_1)
                puts 'You were delt a new card...'
                sleep(2)
                puts "You were delt #{player_1.hand[2].face} of #{player_1.hand[2].suit}"
                sleep(2)
                puts "Hand Value: #{hand_total player_1}"
            else
                puts 'calculating...'
            end
            puts "#{house.name} Cards:"
            sleep(2) 
            puts "#{house.hand[0].face} of #{house.hand[0].suit}"
            puts "#{house.hand[1].face} of #{house.hand[1].suit}"
            sleep(2)
            puts "Hand Value: #{hand_total house}"
            puts '====================='
            sleep(2.5)
            if hand_total(player_1) > 21 
                puts 'Bust you lose!'
                player_1.bank -= 10
                house.bank += 10
                puts "#{player_1.name} now has $ #{player_1.bank} left..."
            elsif hand_total(player_1) > hand_total(house) &&  hand_total(player_1) <= 21 
                puts 'You got Lucky....You Win!!!'
                player_1.bank += 10
                house.bank -= 10
                puts "#{player_1.name} now has $ #{player_1.bank}!!..."
            elsif hand_total(player_1) < hand_total(house) && hand_total(house) <= 21 
                puts 'Better Luck Next Time...You Lose!!'
                player_1.bank -= 10
                house.bank += 10
                puts "#{player_1.name} now has $ #{player_1.bank} left..."
            else 
                puts 'Its a Tie...'
                puts "You still have #{player_1.bank} left..."
            end
            empty_hand(player_1)
            empty_hand(house)
        else
            puts 'Then why are you here!?'
            sleep (2.5)
            puts 'Bye until next time'
        break
        puts 'would you like to play anouther round? Yes (y) No (n)'
        answer = gets.chomp.downcase
        end
    end
    
    
end 

start_game






