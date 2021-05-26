class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def sort
    # A > K > Q > J > 10 > .. > 2
    # spades > hearts > diamonds > clubs
    # bubble sort
    loop do
      swapped = false

      (count - 1).times do |index|
        if @cards[index].rank == @cards[index + 1].rank
          if @cards[index].suit_rank > @cards[index + 1].suit_rank
            @cards[index], @cards[index + 1] = @cards[index + 1], @cards[index]
            swapped = true
          end
        elsif @cards[index].rank > @cards[index + 1].rank
          @cards[index], @cards[index + 1] = @cards[index + 1], @cards[index]
          swapped = true
        end
      end
      break if not swapped
    end
  end

  def merge_sort(unsorted_cards)
    n = unsorted_cards.size.to_f

    if n < 2
      return unsorted_cards
    else
      mid = (n/2).round
      left = unsorted_cards.take(mid)
      right = unsorted_cards.pop(n - mid)

      sorted_left = merge_sort(left)
      sorted_right = merge_sort(right)

      @cards = merge(sorted_left, sorted_right)
    end
  end

  # def merge(left, right)
  #   acc = []
  #
  #   while !left.empty? && !right.empty?
  #     if left[0].rank == right[0].rank
  #       if left[0].suit_rank < right[0].suit_rank
  #         acc << left.shift
  #       else
  #         acc << right.shift
  #       end
  #     elsif left[0].rank < right[0].rank
  #       acc << left.shift
  #     else
  #       acc << right.shift
  #     end
  #   end
  #
  #   @cards = acc + left + right
  # end

  # def merge(left, right)
  #   sorted = []
  #   until left.empty? && right.empty? do
  #     if left.empty?
  #       sorted += right
  #       right = []
  #       @cards = sorted
  #       return sorted
  #     elsif right.empty?
  #       sorted += left
  #       left = []
  #       @cards = sorted
  #       return sorted
  #     elsif left.first.rank == right.first.rank
  #       if left.first.suit_rank < right.first.suit_rank
  #         sorted << left.shift
  #       else
  #         sorted << right.shift
  #       end
  #     elsif left.first.rank < right.first.rank
  #       sorted << left.shift
  #     else
  #       sorted << right.shift
  #     end
  #     @cards = sorted
  #   end
  # end

  def merge(left, right)
    if right.empty?
      return left
    end

    if left.empty?
      return right
    end

    smallest_number = if left[0].rank == right[0].rank
      if left[0].suit_rank < right[0].suit_rank
        left.shift
      else
        right.shift
      end
    elsif left[0].rank < right[0].rank
      left.shift
    else
      right.shift
    end

    recursive = merge(left, right)

    [smallest_number].concat(recursive)
  end
end
#
# Thoughts:
#
# breaks array into halves where sorting and merging will occur
# does this until the size = 1
# recursive - let's say we have an array of [2,1,3]
# that gets broken into [2,1] and [3]
# throw those back into the sort method
# and we have left is [2] and right is [1]
# and left is [3] and right is []
# we will need a method that now puts that back together
#
# [1,5,6,2,3,7,4,8]
# L[1,5,6,2]           R[3,7,4,8]
# L[1,5]R[6,2]         L[3,7]R[4,8]
# L[1]R[5] L[6]R[2]    L[3]R[7] L[4]R[8]
# L[1,5]R[2,6]         L[3,7]R[4,8]
# L[1,2,5,6]           L[3,4,7,8]
#
# This is where the a loop would come in handy, until either left or right is empty, we will shift the first number in the array back into the original array
#
# If left or right is empty then the rest of the other array is tagged on
#
# Sudo code Sort method:
# n = size of array to_f
#
# base condition for recursize function to break out is if size of array less than or equal to 1. Break out to return array
#
# mid = for where we break the array -> (array/2).round
# left = take up to mid
# right = pop size of array - mid
#
# sorted left = sort(left)
# sorted right = sort(right)
#
# After those are sorted, we want to merge left and right back together
#
# Sudo code Merge method:
# acc = []
#
# while left and right have elements
#   compare [0] of both left and right and take smaller of 2 and add to acc
# end
#
# then acc + left + right <- if theyre empty its ok. Gets added anyways
