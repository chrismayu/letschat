require "refile/s3"

aws = {
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  region: "us-west-2",
  bucket: ENV["AWS_S3_BUCKET"],
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws,max_size: 3.megabytes)
Refile.store = Refile::S3.new(prefix: "store", **aws)

 