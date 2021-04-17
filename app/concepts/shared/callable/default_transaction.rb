# frozen_string_literal: true

module Shared::Callable
  class DefaultTransaction
    extend Uber::Callable

    def self.call(*)
      ActiveRecord::Base.transaction do
        yield
      end
    end
  end
end
