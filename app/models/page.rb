# == Schema Information
#
# Table name: pages
#
#  id              :bigint           not null, primary key
#  content         :text
#  english_content :text
#  english_name    :string
#  english_slug    :string
#  name            :string
#  position        :integer          default(1)
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_pages_on_english_name  (english_name) UNIQUE
#  index_pages_on_english_slug  (english_slug) UNIQUE
#  index_pages_on_name          (name) UNIQUE
#  index_pages_on_slug          (slug) UNIQUE
#
class Page < ApplicationRecord
  # extend FriendlyId
  # friendly_id :slug_candidates, use: :slugged

  SPECIAL_PAGES = {
    home: {
      vi: 'trang-chu',
      en: 'home'
    }
  }.freeze

  # Scopes
  scope :ordered, -> { order(position: :asc) }
  scope :except_home, -> {
    where.not(slug: SPECIAL_PAGES[:home].values)
  }

  # Validations
  validates :name, presence: true, uniqueness: true

  # def slug_candidates
  #   locale = I18n.locale.to_sym
  #   locale == :en ? english_name : name
  # end

  # def should_generate_new_friendly_id?
  #   name_changed? || english_name_changed? || super
  # end
end
