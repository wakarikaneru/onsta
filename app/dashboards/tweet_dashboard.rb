require "administrate/base_dashboard"

class TweetDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    parent: Field::BelongsTo,
    id: Field::Number,
    content: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    res_count: Field::Number,
    tirami_count: Field::Number,
    last_update: Field::DateTime,
    res_number: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    parent
    id
    content
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    parent
    id
    content
    created_at
    updated_at
    res_count
    tirami_count
    last_update
    res_number
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    parent
    content
    res_count
    tirami_count
    last_update
    res_number
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how tweets are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tweet)
  #   "Tweet ##{tweet.id}"
  # end
end
