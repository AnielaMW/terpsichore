class UserDevSeeder
  USERS = [
    {
      first_name: "Computer",
      last_name: "Non-user",
      user_name: "Terpsichore",
      email: "anyatravian@gmail.com",
      password: "12041980",
      admin: true
    }, {
      first_name: "Aniela",
      last_name: "Wolkonowski",
      user_name: "Dance Mistress",
      email: "anielamw@gmail.com",
      password: "12041980",
      admin: true
    }, {
      first_name: "Dan",
      last_name: "Seppler",
      user_name: "Napoleon",
      email: "dansemail@gmail.com",
      password: "5678910",
      admin: true
    }, {
      first_name: "Anne",
      last_name: "Elliot",
      user_name: "Persuaded",
      email: "annesemail@gmail.com",
      password: "123456"
    }
  ]

  def self.seed!
    USERS.each do |u_params|
      user = User.find_or_initialize_by(user_name: u_params[:user_name])

      user.update_attributes!(u_params)
    end
  end
end
