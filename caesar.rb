#Known bug is that it won't keep prompting you if your inputs aren't correct..

require 'pry'
newArr=[]

puts "Please enter a word for the cipher:"
string = gets.chomp
unless string.match(/[a-zA-Z]/)
    puts "Please make sure your phrase has some letters!"
    string = gets.chomp
end
puts "And how many characters you would like to shift it?"
if num = gets.chomp.match(/[^0-9\-]/)
    puts "Please make sure this is a number."
    num = gets.chomp
end
num = num.to_i


def caesar(string, num)
    capitals = Array (65..90)
    lowerCase = Array (97..122)
    arr = string.split("")
    newArr = arr.map do |letter|
        l = letter.ord
        newl = ''
        if l >64 && l <91           
            store = capitals.index l
            store2 = store + num
            store2=store2.remainder(26) if store2<-25 || store2>25
            newl = capitals[store2].chr
        elsif l>96 && l<123
            store = lowerCase.index l
            store2= store + num
            store2=store2.remainder(26) if store2<-25 || store2>25
            newl = lowerCase[store2].chr
        else
            newl = letter
        end
        newl
    end
    p newArr.join
end

caesar(string,num)
