# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD'],
)

Genre.create!(
    [
      {
        name: '公園',
      },
      {
        name: '無料室内スペース',
      },
      {
        name: '有料室内スペース',
      },
      {
        name: '児童館',
      },
      {
        name: 'ゲームセンター',
      },
      {
        name: '遊園地',
      }
    ]
  )