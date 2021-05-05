namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    ridgepole('--apply', "--file #{schema_file}")
    Rake::Task['db:schema:dump'].invoke if Rails.env.development?
  end

  private def schema_file
    Rails.root.join('db/Schemafile') # rubocop:disable Rails/FilePath
  end

  private def config_file
    Rails.root.join('db/config.yml') # rubocop:disable Rails/FilePath
  end

  private def ridgepole(*options)
    command = ['bundle exec ridgepole', "--config #{config_file}"]
    system [command + options].join(' ')
  end
end
