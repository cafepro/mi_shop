class CreateSpree<%= class_name.pluralize %>Translations < ActiveRecord::Migration[5.1]
  def change
    Spree::<%= class_name %>.create_translation_table!({
<% attributes.each do |attribute| -%>
<% next unless options[:i18n].include? attribute.name -%>
      <%= attribute.name %>: :<%= attribute.type %>,
<% end -%>
    })
  end
end
