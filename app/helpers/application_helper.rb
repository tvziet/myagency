module ApplicationHelper
  # include Rails.application.routes.url_helpers

  def page_slug(page)
    I18n.locale == :en ? page.english_slug : page.slug
  end

  def myagency_info_data
    myagency_info = MyAgencyInfo.first
    {
      address: I18n.locale == :en ? myagency_info.english_address : myagency_info.address,
      phone_number: myagency_info.phone_number,
      email: myagency_info.email
    }
  end

  def rails_blob_url(variant)
    Rails.application.routes.url_helpers.rails_blob_url(variant, only_path: true)
  end
end
