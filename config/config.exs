import Config

config :test_mailtrap, TestMailtrap.Mailer,
  adapter: Bamboo.MailtrapSendingAdapter,
  api_token: System.get_env("API_TOKEN")

# config :test_mailtrap, TestMailtrap.Mailer,
#   adapter: Bamboo.MailtrapSandboxAdapter,
#   api_token: System.get_env("API_TOKEN"),
#   inbox_id: 2048945
