class FillCompleteNameSearch < ActiveRecord::Migration[5.1]
  def change
    Spree::Asociate.all.each do |asociate|
      asociate.complete_name_search = "#{asociate.complete_name} #{asociate.complete_name.parameterize.gsub('-',' ')}"
      asociate.save
    end
  end
end
