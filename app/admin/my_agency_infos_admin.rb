Trestle.resource(:my_agency_infos) do
  menu do
    item :my_agency_infos, icon: 'fas fa-info-circle', label: t('activerecord.models.my_agency_info.one')
  end

  helper do
    include Rails.application.routes.url_helpers

    def display_image(attachment)
      if attachment.attached?
        image_tag(main_app.rails_blob_url(attachment),
                class: 'img-thumbnail',
                style: 'max-width: 100px; height: auto;')
      else
        content_tag(:span, 'No image', class: 'text-muted')
      end
    end
  end

  table sortable: false do
    column :email
    column :address
    column :english_address
    column :phone_number
    column :facebook_name
    column :facebook_link
    column :logo, header: -> { content_tag(:i, nil, class: 'fa fa-image') + ' Logo' } do |my_agency_info|
      display_image(my_agency_info.logo)
    end
    column :qr_image, header: -> { content_tag(:i, nil, class: 'fa fa-image') + ' QR' } do |my_agency_info|
      display_image(my_agency_info.qr_image)
    end
    actions
  end

  form do |my_agency_info|
    email_field :email
    text_field :address
    text_field :english_address
    text_field :phone_number
    text_field :facebook_name
    text_field :facebook_link
    file_field :logo
    file_field :qr_image
  end

  params do |params|
    params.require(:my_agency_info).permit(:email, :address, :english_address, :phone_number, :facebook_name, :facebook_link, :logo, :qr_image)
  end

  controller do
    before_action :check_existing_record, only: [:new, :create]

    private

    def check_existing_record
      if MyAgencyInfo.exists?
        flash[:error] = t('errors.exists_my_agency_info')
        redirect_to admin.path(:index)
      end
    end
  end
end
