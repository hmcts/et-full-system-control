require "docker"
class FullSystem < ::Rails::Command::Base
  desc "stop [SERVICE]", "Stop a service (web or sidekiq)"
  def stop(service)
    Docker.url = 'unix:///var/run/docker.sock'
    containers = Docker::Container.all(all: true, filters: JSON.dump(label: ['traefik.http.routers.et1-router.service=et1-service']))
    # For now just accept the first one - we need to be a bit more intelligent though
    container = containers.first
    exec_instance = container.exec ['invoker', 'remove', service] do |stream_type, stream_content|
      debug = 1
    end
  end
end
