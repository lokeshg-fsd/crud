# frozen_string_literal: true

require_relative '../build_database'

# Database Builder
namespace :intialize_db do
  desc 'Build The Intial Data Base'

  task build: :environment do
    Library::BuildDatabase.new.build
  end
end
