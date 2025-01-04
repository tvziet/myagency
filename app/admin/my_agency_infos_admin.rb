Trestle.resource(:my_agency_infos) do
  menu do
    item :my_agency_infos, icon: 'fas fa-info-circle', label: t('activerecord.models.my_agency_info.one')
  end

  table sortable: false do
    column :email
    column :address
    column :english_address
    column :phone_number
    column :facebook_name
    column :facebook_link
    column :logo do |my_agency_info|
      if my_agency_info.logo.attached?
        variant = my_agency_info.logo.variant(resize_to_limit: [100, 100])
        image_tag(rails_blob_url(variant), class: 'img-thumbnail')
      end
    end
    column :qr_image do |my_agency_info|
      if my_agency_info.qr_image.attached?
        variant = my_agency_info.qr_image.variant(resize_to_limit: [100, 100])
        image_tag(rails_blob_url(variant), class: 'img-thumbnail')
      end
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
    if my_agency_info.logo.attached?
      variant = my_agency_info.logo.variant(resize_to_limit: [100, 100])
      static_field :current_logo, label: t('admin.static_fields.current_logo') do
        content_tag(:img, '',
          src: rails_blob_url(variant),
          class: 'img-thumbnail',
          style: 'max-width: 100px; height: auto;')
      end
    end

    if my_agency_info.qr_image.attached?
      variant = my_agency_info.qr_image.variant(resize_to_limit: [100, 100])
      static_field :current_qr_image, label: t('admin.static_fields.current_qr') do
        content_tag(:img, '',
          src: rails_blob_url(variant),
          class: 'img-thumbnail',
          style: 'max-width: 100px; height: auto;')
      end
    end
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
