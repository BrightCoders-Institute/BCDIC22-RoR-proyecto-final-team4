# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Schema[7.0].define() do
  User.create!([{ email: "procuponss@gmail.com", name: "Admin", password: "123456" }])

  Cupon.create(title: "Tenis Training Hombre Nike Legend Essential3 Next Nature",
  url: "https://articulo.mercadolibre.com.mx/MLM-1535528501-tenis-training-hombre-nike-legend-essential3-next-nature-_JM#position=19&search_layout=grid&type=item&tracking_id=d6068d8f-ab4e-49f4-b47e-507ba792a28f&c_id=/home/promotions-recommendations/element&c_element_order=3&c_uid=5b10794e-59bd-47ad-9bde-d1642b78793e",
  description: "El diseño completo permite apoyar el talón sobre una suela plana para ofrecer estabilidad durante los levantamientos y las sentadillas.",
  location: "Nike Tienda oficial de Mercado Libre",
  image_url: 'https://http2.mlstatic.com/D_NQ_NP_885200-MLM54778762975_032023-O.webp',
  normal_price: "1599",
  discount_price: "1119",
  start_date: "Tue, 04 Apr 2023",
  expiration_date: "Mon, 24 Apr 2023" ,
  user: User.first)

  Cupon.create(title: "Microsoft Xbox Series S 512GB Standard color blanco",
  url: "https://www.mercadolibre.com.mx/microsoft-xbox-series-s-512gb-standard-color-blanco/p/MLM16650345?pdp_filters=deal:MLM779363-1#searchVariation=MLM16650345&position=2&search_layout=grid&type=product&tracking_id=e31c1e41-506f-4fa6-896d-e7bf2b11a1b0&c_id=/home/promotions-recommendations/element&c_element_order=2&c_uid=0d1c1e77-293e-4530-9b63-b4b7941cd672",
  description: "Con tu consola Xbox Series tendrás entretenimiento asegurado todos los días. Su tecnología fue creada para poner nuevos retos tanto a jugadores principiantes como expertos.", 
  location: "Colima San Fernando",
  image_url: 'https://http2.mlstatic.com/D_NQ_NP_771415-MLA44492818319_012021-O.webp',
  normal_price: "6516",
  discount_price: "5499",
  start_date: "Tue, 04 Apr 2023",
  expiration_date: "Mon, 24 Apr 2023" ,
  user: User.first)

  Cupon.create(title: "Xiaomi Redmi Note 10 Pro 108 Mpx Dual SIM 256 GB gris ónix 8 GB RAM",
  url: "https://www.mercadolibre.com.mx/xiaomi-redmi-note-10-pro-108-mpx-dual-sim-256-gb-gris-onix-8-gb-ram/p/MLM20916206?pdp_filters=deal:MLM779363-1#searchVariation=MLM20916206&position=1&search_layout=grid&type=product&tracking_id=86100ec8-e7c7-4bb0-b81a-1acefbffaea5&c_id=/home/promotions-recommendations/element&c_element_order=1&c_uid=74ac8761-16e0-47b0-98c2-617c6a11e825",
  description: "Experiencia visual increíble Mira tus series y películas favoritas con la mejor definición a través de su pantalla AMOLED de 6.67. Disfruta de colores brillantes y detalles precisos en todos tus contenidos.", 
  location: "JD DEP Tienda oficial de Mercado Libre",
  image_url: 'https://http2.mlstatic.com/D_NQ_NP_689330-MLA50263507908_062022-O.webp',
  normal_price: "5099",
  discount_price: "4999",
  user: User.first)

  Cupon.create(title: "5 Micas Protectoras Para Xiaomi Mi Band 5 Compatible M5",
  url: "https://articulo.mercadolibre.com.mx/MLM-859136782-5-micas-protectoras-para-xiaomi-mi-band-5-compatible-m5-_JM#reco_item_pos=4&reco_backend=machinalis-p2p&reco_backend_type=function&reco_client=home_second-best-buying-trend-recommendations&reco_id=703d5f20-4774-4e77-acc0-a82602de4cdb&c_id=/home/second-best-trends-recommendations/element&c_element_order=5&c_uid=9038ca83-4355-447d-bbd2-db04c431fec9",
  description: "Color: transparente Material: suave TPU Modelo Compatible: pulsera inteligente Xiaomi Mi Band 5 Protección contra rasguños, golpes y manchas diarias, protege su reloj de caídas accidentales.", 
  location: "SMART WATCH MX",
  image_url: 'https://http2.mlstatic.com/D_NQ_NP_999233-MLM44506916506_012021-O.webp',
  normal_price: "79",
  discount_price: "75",
  start_date: "Tue, 04 Apr 2023",
  expiration_date: "Mon, 24 Apr 2023" ,
  user: User.first)

  Cupon.create(title: "Back Pack Hombre Vermonti By Aldo Conti h8486",
  url: "https://articulo.mercadolibre.com.mx/MLM-1405357371-back-pack-hombre-vermonti-by-aldo-conti-h8486-_JM?variation=174403007597#reco_item_pos=1&reco_backend=machinalis-p2p&reco_backend_type=function&reco_client=home_cart-recommendations&reco_id=a1369147-0511-4dcc-8f06-1f46d2aca702&c_id=/home/cart-recommendations/element&c_element_order=2&c_uid=93700afd-911a-41f9-b904-4ba0e5e0d867",
  description: "Si no te quedó o no te gustó tu prenda, puedes cambiarla en cualquiera de nuestras sucursales de línea (no aplica para compras realizadas a través de FULL, por favor contáctenos) únicamente deberás presentar tu ticket de compra no mayor a 30 días y la prenda con todas sus etiquetas tal cual lo recibiste.*Antes de iniciar un reclamo por cambio de talla o devolución por favor contáctenos por mensaje sera mas rapido y facil*", 
  location: "ALDO CONTI ITALIA Tienda oficial de Mercado Libre",
  image_url: 'https://http2.mlstatic.com/D_NQ_NP_780542-MLM54366718099_032023-O.webp',
  normal_price: "873",
  discount_price: "298",
  start_date: "Tue, 04 Apr 2023",
  expiration_date: "Mon, 24 Apr 2023" ,
  user: User.first)
end