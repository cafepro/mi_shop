Deface::Override.new(
  virtual_path: 'spree/layouts/admin/products/form',
  name: 'add_admin_menu_bottom_tabs',
  insert_bottom: '#main-sidebar',
  partial: 'shared/main_menu'
)
