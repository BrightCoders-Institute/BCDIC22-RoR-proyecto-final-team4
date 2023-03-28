# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Schema[7.0].define() do
  User.create([{ email: "chido@gmail.com", name: "Ever" }])
  Cupon.create(title: "publicacion 1",description: "Descripcion 1", image_url: 'https://imgs.search.brave.com/UrL4xlJwvQWFAX-KgCj9ChNSwoi5uPXObaJbj2G9EI8/rs:fit:965:548:1/g:ce/aHR0cHM6Ly9lMDAt/ZWxtdW5kby51ZWNk/bi5lcy9hc3NldHMv/bXVsdGltZWRpYS9p/bWFnZW5lcy8yMDE5/LzAxLzA0LzE1NDY1/OTkyMjc2ODUxLmpw/Zw', user: User.first)
  Cupon.create(title: "publicacion 2",description: "Descripcion 2", image_url: 'https://imgs.search.brave.com/nND0uQHTfCazhBRkgR84RTkyCEn6E4ZL53LqSYwKLVk/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9pMi53/cC5jb20vd3d3Lm9m/ZXJ0YXNhaG9yYS5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MTUvMDkvTGEtRGVz/cGVuc2EtZmFtaWxp/YXItdGFtYmllbi1j/b24tZGVzY3VlbnRv/cy1lbi1maW4tZGUt/MTlzZXAxNS5qcGc_/c3NsPTE', user: User.first)
  Cupon.create(title: "publicacion 3",description: "Descripcion 3", image_url: 'https://imgs.search.brave.com/vkl6kb70nsfm0BJ7gSYYVF7LwJ4zcxe1mwg_YliHqMM/rs:fit:1200:966:1/g:ce/aHR0cHM6Ly9pMS53/cC5jb20vd3d3Lm9m/ZXJ0YXNhaG9yYS5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MTMvMTEvZGVzY3Vl/bnRvcy1FQVNZLUJV/WS1lbC1zYWx2YWRv/ci1jb21wcmFzLWNv/bi1wcmVjaW9zLWJh/am9zLTA4bm92MTMu/anBnP3NzbD0x', user: User.first)
  Cupon.create(title: "publicacion 4",description: "Descripcion 5", image_url: 'https://imgs.search.brave.com/a1-yTXgQbLMvhZriJInexZER7ynFxJRl9AhhxY9T1IY/rs:fit:1024:580:1/g:ce/aHR0cHM6Ly9jZG4u/Y21zLnRhZ2FkYW1l/ZGlhLmNvbS9wcnVl/YmF5YW14LzIwMjEt/MDEvcHJvZHVjdG9z/LW94eG8tMS5qcGVn', user: User.first)
  Cupon.create(title: "publicacion 5",description: "Descripcion 6", image_url: 'https://imgs.search.brave.com/jz9hjhnuHhgUS1M7H0ROyJX5jsF4N1z-6zkpiZVDb_4/rs:fit:1200:427:1/g:ce/aHR0cHM6Ly9tazBj/YXphb2ZlcnRhc2M2/bmNjMi5raW5zdGFj/ZG4uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE5LzA3L3Rv/dHR1cy1lc3BlY2lh/bC1jZXJ2ZXphLmpw/Zw', user: User.first)
end