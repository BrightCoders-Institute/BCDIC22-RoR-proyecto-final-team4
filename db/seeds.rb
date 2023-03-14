# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([{ email: "chido@gmail.com", name: "Ever" }])
  Cupon.create(title: "publicacion 1",description: "Descripcion 1", image_url: 'https://imgs.search.brave.com/WYA2l9LzIOrQP8qyrGsnU_W65_jjbmXYV0-I6wtJG8Q/rs:fit:711:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC4z/UVNLeC0xUDVmazBr/STZVVFRvU1lRSGFF/OCZwaWQ9QXBp', user: users.first)
  Cupon.create(title: "publicacion 2",description: "Descripcion 2", image_url: 'https://imgs.search.brave.com/h1VcA1FX0DxUiTgVUI_EHbyYnIb_r5y2lFTU6YCu0ug/rs:fit:1200:1000:1/g:ce/aHR0cDovLzIuYnAu/YmxvZ3Nwb3QuY29t/Ly1XaWJJNE1xbFI3/cy9UMk9NQU1OaV85/SS9BQUFBQUFBQVd6/WS9mN0FHRjJUd3Vm/NC9zMTYwMC9Mb3Mt/bWFzLUhlcm1vc29z/LVBhaXNhamVzLU5h/dHVyYWxlc18wMy5q/cGc', user: users.first)
  Cupon.create(title: "publicacion 3",description: "Descripcion 3", image_url: 'https://imgs.search.brave.com/_y01c4Vg5CyTWp553hwMRSgq5opNZFuaxQby8DuYS30/rs:fit:1200:1000:1/g:ce/aHR0cDovLzIuYnAu/YmxvZ3Nwb3QuY29t/Ly1hRFhVMG5DN3dV/ay9VZVZZQ1ZYMFg4/SS9BQUFBQUFBQUFt/Yy9ONEtvejI4MEFl/ay9zMTYwMC91biUy/Qmhlcm1vc29zJTJC/cGFpc2FqZSUyQjYu/anBn', user: users.first)
  Cupon.create(title: "publicacion 4",description: "Descripcion 4", image_url: 'https://imgs.search.brave.com/19p_mC-TUQ1HLqZEuv-Vy4o-G2VRrCUFv9RJhCF1D_o/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly80LmJw/LmJsb2dzcG90LmNv/bS9fRVoxNnZXWXZI/SGcvUzlSck1PVEpv/REkvQUFBQUFBQUFM/VEUvdjVIV0JyWkhF/dUkvczE2MDAvd3d3/LkJhbmNvZGVJbWFn/ZW5lc0dyYXR1aXRh/cy5jb20rLUNyaWF0/dXJhcy0xMS5qcGc', user: users.first)
  Cupon.create(title: "publicacion 5",description: "Descripcion 5", image_url: 'https://imgs.search.brave.com/tYBPiSS0BjegXl3Ej_y88KnRYtUUfmH0FfgHLGgV5uY/rs:fit:1200:1000:1/g:ce/aHR0cHM6Ly80LmJw/LmJsb2dzcG90LmNv/bS8tM2RiWkpsOGtM/U0kvVUh6RmtVTHNf/ckkvQUFBQUFBQUJM/cWsvaDZIRkxYaVJR/RGMvczE2MDAvcHVt/cGtpbi1hbmQtY2Fu/ZGxlcy0xOTIweDEy/MDAtd2FsbHBhcGVy/LWltYWdlbmVzLXBh/cmEtaGFsbG93ZWVu/LmpwZw', user: users.first)
  Cupon.create(title: "publicacion 6",description: "Descripcion 6", image_url: 'https://imgs.search.brave.com/r7-8Ns1FkR1yQBGsABqhKKxaCP7lsKzkD9yuN1tcIe4/rs:fit:736:975:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vNzM2/eC83NC9kYi8zNy83/NGRiMzc4NDNjZDIy/NzRjYzkyYjBkYzgw/MWFlNzIyMS5qcGc', user: users.first)
  ActiveRecord::Schema[7.0].define() do
end