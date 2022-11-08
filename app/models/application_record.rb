class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.to_csv
    attributes = self.set_attributes
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |movie|
        csv << movie.attributes.values_at(*attributes)
      end
    end
  end
end
