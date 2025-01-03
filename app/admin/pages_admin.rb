Trestle.resource(:pages) do
  menu do
    item :pages, icon: 'fas fa-scroll', priority: 1, label: t('activerecord.models.page.one')
  end

  table do
    column :name
    column :english_name
    column :position
    column :content do |page|
      truncate(strip_tags(page&.content), length: 100)
    end
    column :english_content do |page|
      truncate(strip_tags(page&.english_content), length: 100)
    end
    actions
  end

  form do |page|
    tab :basic_info, label: t('admin.tabs.basic_info') do
      row do
        col(sm: 12) { number_field :position }
      end

      row do
        col(sm: 6) { text_field :name }
        col(sm: 6) { text_field :english_name }
      end
    end

    tab :content_info, label: t('admin.tabs.content_info') do
      row do
        editor :content
      end

      row do
        editor :english_content
      end
    end
  end

  params do |params|
    params.require(:page).permit(:name, :english_name, :position, :content, :english_content)
  end
end
