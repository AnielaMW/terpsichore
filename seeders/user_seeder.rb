class UserDevSeeder
  USERS = [
    {
      first_name: "Aniela",
      last_name: "Wolkonowski",
      username: "Dance Mistress",
      email: "anielamw@gmail.com",
      location: "NY, USA",
      dancer: true,
      password: "12041980",
      admin: true,
      privacy1: true,
      privacy3: true,
      privacy4: true
    }, {
      first_name: "Dan",
      last_name: "Seppler",
      email: "dansemail@gmail.com",
      password: "5678910",
      admin: true
    }, {
      first_name: "Anne",
      last_name: "Elliot",
      email: "annesemail@gmail.com",
      password: "123456"
    }
  ]

  def self.seed!
    USERS.each do |u_params|
      user = User.find_or_initialize_by(email: u_params[:email])

      user.update_attributes!(u_params)
    end
  end
end
