class LandingPage < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :delete

  has_many_attached :images

  validates :html, :title, presence: true
  validates :title, uniqueness: true

  def display(attrs)
    split_html = html.split("</head>")
    head = split_html[0]
    body = split_html[1..-1].join
    new_html = "#{head}<style>#{css}</style></head>#{body}"
    if attrs[:with_back_button]
      split_html = new_html.split("</body>")
      head = split_html[0]
      body = split_html[1..-1].join
      back_button = '<div style="z-index:99999;text-align: center; font-family: arial; padding: 23px 0; position: fixed; bottom: 0px; left: 0px; width: 100%; border-top: 1px solid grey; background-color: white;" >
                      <a href="/user/landing_pages/" style="text-decoration: none; color: rgb(0,175,160); font-size: 20px; font-weight: bold;">Revenir à mes pages</a>
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
