def basket_calc(books_array)

  BookList.new(books_array).find_cheapest_combo.inject(0) {|total,set|
     total += discount(set)
     total
   }.round(2)

end

class BookList

  attr_accessor :books, :tally

  def initialize(books)
    @books = books
  end

  def make_tally
    tally = {
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0
    }
    tally = @books.inject(tally) do |tally,book_id|
        tally[book_id] += 1
        tally
    end
  end

  def find_cheapest_combo

      new_sets = seperate_books.select do |array|
        array.length != 3 && array.length != 5
      end

      sets_with_3 = seperate_books.select do |array|
        array.length == 3
      end

      sets_with_5 = seperate_books.select do |array|
        array.length == 5
      end

      if sets_with_3.size == 0 || sets_with_5.size == 0
        return seperate_books
      end

      #test atm = [1,2,3,4,5] [1,2,3]

      array_to_use     = sets_with_3.size < sets_with_5.size ? sets_with_3 : sets_with_5
      array_not_to_use = sets_with_3.size < sets_with_5.size ? sets_with_5 : sets_with_3

      array_to_use.each_with_index do |current_array, index|
        (1..5).each do |i|
          if !(current_array.include? i) && current_array.size == 3
            array_not_to_use[index].delete(i)
            current_array << i
          elsif current_array.size == 5
            current_array.delete(i)
            array_not_to_use[index] << i
          end
        end
      end

      #sets of 4
      array = array_to_use.concat(array_not_to_use).concat(new_sets)
  end

  def seperate_books

    array_of_arrays = []

    make_tally.each do |key,value|
      i = 0
      value.times {

        if array_of_arrays[i].nil?
            array_of_arrays[i] = []
        end

        array_of_arrays[i] << key
        i+=1
      }
    end

    array_of_arrays
  end

end

def discount(books)

  standard_price = books.size * 8.00

  if books.uniq.size == 1
    return standard_price
  end

  case books.size
  when 2
    standard_price * 0.95
  when 3
    standard_price * 0.90
  when 4
    standard_price * 0.80
  else
    standard_price * 0.75
  end
end
