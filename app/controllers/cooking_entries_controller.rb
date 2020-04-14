class CookingEntriesController < ApplicationController
    def show
        find_entry
        convert_time(@cooking_entry[:date])
    end

    private

    def find_entry
        @cooking_entry = CookingEntry.find(params[:id])
    end

    def convert_time(datetime)
        @date = datetime.strftime("%B %d, %Y")
        @time = datetime.strftime("%I:%M %p")
    end
end
