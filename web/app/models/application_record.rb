# frozen_string_literal: true

# 基底アクティブレコード
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
