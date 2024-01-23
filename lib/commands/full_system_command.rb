require "docker"
class FullSystem < ::Rails::Command::Base
  desc "stop [SERVICE]", "Stop a service (web or sidekiq)"
  def stop(service)
    container.exec ['invoker', 'remove', service] do |stream_type, stream_content|
      debug = 1
    end
  end

  desc "start [SERVICE]", "Start a service (web or sidekiq)"
  def start(service)
    container.exec ['invoker', 'add', service] do |stream_type, stream_content|
      debug = 1
    end
  end

  private

  def container
    @container ||= Docker::Container.all(all: true, filters: JSON.dump(label: ["et-full-system.service.source=#{service_root_dir}"])).first
  end

  def service_root_dir(dir = Dir.pwd)
    return dir if File.exist?(File.join(dir, 'Gemfile'))
    return nil if dir == '/'

    service_root_dir(File.dirname(dir))
  end
end
