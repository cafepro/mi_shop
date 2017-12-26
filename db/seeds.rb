# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

layout = Spree::Layout.create(name: "Home",
                     header: '<!-- Navigation -->
                               <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
                                 <div class="container">
                                   <%= link_to t("main_site.logo"), root_path, class: "navbar-brand js-scroll-trigger" %>
                                   <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                                     <span class="navbar-toggler-icon"></span>
                                   </button>
                                   <div class="collapse navbar-collapse" id="navbarResponsive">
                                     <%= render_menu %>
                                   </div>
                                 </div>
                               </nav>

                               <header class="masthead text-center text-white d-flex">
                                 <div class="container my-auto">
                                   <div class="row">
                                     <div class="col-lg-10 mx-auto">
                                       <h1 class="text-uppercase">
                                         <strong><%= t("header.header_title").html_safe %></strong>
                                       </h1>
                                       <hr>
                                     </div>
                                     <div class="col-lg-8 mx-auto">
                                       <p class="text-faded mb-5"><%= t("header.header_text").html_safe %></p>
                                       <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about"><%= t("header.header_button").html_safe %></a>
                                     </div>
                                   </div>
                                 </div>
                               </header>
                           ',
                    body: '',
                    footer: '<section class="bg-dark text-white">
                              <div class="container text-center">
                                <h2 class="mb-4">Free Download at Start Bootstrap!</h2>
                                <a class="btn btn-light btn-xl sr-button" href="http://startbootstrap.com/template-overviews/creative/">Download Now!</a>
                              </div>
                            </section>

                            <section id="contact">
                              <div class="container">
                                <div class="row">
                                  <div class="col-lg-8 mx-auto text-center">
                                    <h2 class="section-heading">Let s Get In Touch!</h2>
                                    <hr class="my-4">
                                    <p class="mb-5">Ready to start your next project with us? Thats great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-4 ml-auto text-center">
                                    <i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
                                    <p>123-456-6789</p>
                                  </div>
                                  <div class="col-lg-4 mr-auto text-center">
                                    <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
                                    <p>
                                      <a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a>
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </section>',
                    custom_css: '',
                    custom_js: '',
                    front_default: true,
                    back_default: true,
                    analytics_code: ''
                  )

Spree::Page.create(name: 'Home',
                   description: 'Home page',
                   link: '#page-top',
                   url: '#page-top',
                   target_blank: false,
                   title: 'Home miShop',
                   keywords: '',
                   seo_code: '',
                   publish_at: DateTime.now,
                   expire_at: nil,
                   body: '<!-- Navigation -->
                           <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
                             <div class="container">
                               <%= link_to t("main_site.logo"), root_path, class: "navbar-brand js-scroll-trigger" %>
                               <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                                 <span class="navbar-toggler-icon"></span>
                               </button>
                               <div class="collapse navbar-collapse" id="navbarResponsive">
                                 <%= render_menu %>
                               </div>
                             </div>
                           </nav>

                           <header class="masthead text-center text-white d-flex">
                             <div class="container my-auto">
                               <div class="row">
                                 <div class="col-lg-10 mx-auto">
                                   <h1 class="text-uppercase">
                                     <strong><%= t("header.header_title").html_safe %></strong>
                                   </h1>
                                   <hr>
                                 </div>
                                 <div class="col-lg-8 mx-auto">
                                   <p class="text-faded mb-5"><%= t("header.header_text").html_safe %></p>
                                   <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about"><%= t("header.header_button").html_safe %></a>
                                 </div>
                               </div>
                             </div>
                           </header>',
                    custom_css: '',
                    custom_js: '',
                    position: 1,
                    parent_id: 0,
                    layout_id: layout.id,
                    in_menu: true,
                    hidden: false,
                    is_home: true,
                    no_index: false,
                    no_follow: false
                  )
