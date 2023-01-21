defmodule TestMailtrap do
  @moduledoc """
  Documentation for `TestMailtrap`.
  """

  import Bamboo.Email

  def test_all do
    # test_simple()
    test_attachment()
  end

  @doc """
  * Ensure that boundary part ids are generated by AWS (E.g. _Part_342022_1609907407.1636532595626)
  * Ensure subject has emoji and non-unicode characters
  * Ensure friendly name has emoji and non-unicode characters
  """
  def test_simple do
    welcome_email() |> TestMailtrap.Mailer.deliver_now() 
  end

  def test_attachment do
    welcome_email()
      |> put_attachment(Path.join(__DIR__, "../invoice.pdf"), content_id: "invoice-pdf-1")
      |> put_attachment(Path.join(__DIR__, "../song.mp3"))
      |> TestMailtrap.Mailer.deliver_now() 
  end

  def welcome_email(subject \\ "Subject 现象 🇰🇬  😂", friendly_name \\ "Кыкең Мыкең 🇰🇬  😂", to \\ "kalys.osmonov@gmail.com") do
    new_email(
      to: {friendly_name, to},
      from: {"Кыкең", "kalys@mailtrap.osmonov.com"},
      subject: subject,
      html_body: "<strong>Thanks for joining!</strong>",
      text_body: "Thanks for joining!"
    )
  end
end
