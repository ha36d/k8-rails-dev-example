CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    provider: 'AWS',
    aws_access_key_id: 'myaccesskey',
    aws_secret_access_key: 'mysecretkey',
    region: 'eu-west-3',
    host: 'minio.default.svc.cluster.local',
    endpoint: 'http://minio.default.svc.cluster.local:9000',
    path_style: true
  }

  config.fog_directory  = 'carrierwave'
  config.storage = :fog

end
