class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  config.i18n.default_locale = :ja

end
