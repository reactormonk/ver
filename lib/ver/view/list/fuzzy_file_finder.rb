require 'ver/vendor/fuzzy_file_finder'

module VER
  class View::List::FuzzyFileFinder < View::List
    FFF = ::FuzzyFileFinder

    def fffinder
      @fffinder ||= FFF.new
    rescue FFF::TooManyEntries
      message "The FuzzyFileFinder is overwhelmed by the amount of files"
      destroy
    end

    def update
      choices = fffinder.find(entry.value.chomp('/'))
      choices = choices.sort_by{|m| [-m[:score], m[:path]] }

      list.clear

      choices.each do |choice|
        insert_choice(choice)
      end
    end

    def insert_choice(choice)
      path, score = choice.values_at(:path, :score)
      list.insert(:end, path)

      color =
        case score
        when 0          ; '#fff'
        when 0   ..0.25 ; '#f00'
        when 0.25..0.75 ; '#ff0'
        when 0.75..1    ; '#0f0'
        end

      list.itemconfigure(:end, background: color)
    end
  end
end