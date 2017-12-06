Deface::Override.new(
  virtual_path: 'spree/admin/products/form',
  name: 'add_with_attachments_to_products_form',
  replace: "[data-hook='admin_product_form_promotionable']",
  text: 'hola'
  # partial: "spree/admin/products/with_attachments_form_field"
)
