class LandingPage < ApplicationRecord
  has_many :landing_pages_users, inverse_of: :landing_page
  has_many :users, through: :landing_pages_users

  has_many_attached :images

  validates :html, :title, presence: true
  validates :title, uniqueness: true
  accepts_nested_attributes_for :landing_pages_users,
                                reject_if: proc { |attributes| attributes[:user_id].blank? },
                                allow_destroy: true

  def display(attrs)
    split_html = html.split("</head>")
    head = split_html[0]
    body = split_html[1..-1].join
    new_html = "#{head}<style>#{css}</style></head>#{body}"
    if attrs[:with_back_button]
      split_html = new_html.split("</body>")
      head = split_html[0]
      body = split_html[1..-1].join
      back_button = '<div style="text-align: center; font-family: arial; padding: 23px 0; position: fixed; bottom: 0px; left: 0px; width: 100%; border-top: 1px solid grey; background-color: white;" >
                      <a href="/" style="text-decoration: none; color: #469AE0; font-size: 20px; font-weight: bold;">Revenir sur MihiVai</a>
                    </div>
                    <div style="height: 70px;"></div>'
      new_html = "#{head}#{back_button}</body>#{body}"
    end
    new_html
  end

  def text
    ''
  end
end
