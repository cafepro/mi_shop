class ProductsController < Spree::StoreController
  include MiShopBaseController
  layout 'application'

  helper 'spree/products'
  helper 'spree/taxons'

  before_action :set_layout
  before_action :set_menu
  before_action :load_product, only: :show

  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def show
    @variants = @product.variants_including_master.
                spree_base_scopes.
                active(current_currency).
                includes([:option_values, :images])
    @product_properties = @product.product_properties.includes(:property)
    @taxon = params[:taxon_id].present? ? Spree::Taxon.find(params[:taxon_id]) : @product.taxons.first
    redirect_if_legacy_path

    render 'spree/products/show'
  end

  private

  def load_product
    @products = if try_spree_current_user.try(:has_spree_role?, 'admin')
                  Spree::Product.with_deleted
                else
                  Spree::Product.active(current_currency)
                end

    @product = @products.includes(:variants_including_master, variant_images: :viewable).
               friendly.distinct(false).find(params[:id])
  end

  def set_layout
    @layout = get_shop_layout
  end

  def set_menu
    @menu = get_main_menu
  end

  def redirect_if_legacy_path
    # If an old id or a numeric id was used to find the record,
    # we should do a 301 redirect that uses the current friendly id.
    if params[:id] != @product.friendly_id
      params[:id] = @product.friendly_id
      params.permit!
      redirect_to url_for(params), status: :moved_permanently
    end
  end

end
