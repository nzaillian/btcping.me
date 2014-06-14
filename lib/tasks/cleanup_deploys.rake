require 'fileutils'

desc "removes all but the last two deploys (so we can keep our \"releases\" directory a reasonable size)"
task :cleanup_deploys do
  deploy_root = File.expand_path("../../../../..", __FILE__)
  releases_dir = "#{deploy_root}/releases"

  old_backup_paths = Dir["#{releases_dir}/*"].sort[0...-2]
  
  old_backup_paths.each do |old_backup_path|
    puts "cleaning up old release #{old_backup_path}"
    FileUtils.rm_rf(old_backup_path)
  end
end