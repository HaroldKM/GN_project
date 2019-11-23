module AccountsHelper
  def profile_picture account, width=100
    image_path = account.image.present? ? account.image.url: "ubuntu-550x309.jpg"
    image_tag(image_path,width: width, class: "profil-pic")
  end

  def can_edit_profil? profil_id
    account_signed_in? && current_account.id == profil_id
  end
end
