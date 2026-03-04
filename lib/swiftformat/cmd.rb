require "colored2"
require "shellwords"

module Danger
  class Cmd
    def self.run(cmd)
      shell_cmd = cmd.shelljoin
      stdout, stderr, status = Open3.capture3(shell_cmd)
      [stdout, stderr, status]
    end
  end
end
