class YearWorker
    include Sidekiq::Worker
    sidekiq_options retry: 5

    def perform(start_year)
        AcademicYear.where( end_year:start_year ).each do |year|
            year.is_active = false if year.is_active
        end
    end
end