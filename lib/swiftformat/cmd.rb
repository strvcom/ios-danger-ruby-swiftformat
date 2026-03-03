require "colored2"
require "shellwords"

module Danger
  class Cmd
    def self.run(cmd)
      shell_cmd = cmd.shelljoin
      $stderr.puts "[Cmd.run DEBUG] shell_cmd=#{shell_cmd.inspect}" if cmd.any? { |c| c.to_s.include?("swiftformat") && !c.to_s.include?("--version") }
      $stderr.puts "[Cmd.run DEBUG] cwd=#{Dir.pwd.inspect}" if cmd.any? { |c| c.to_s.include?("swiftformat") && !c.to_s.include?("--version") }
      stdout, stderr, status = Open3.capture3(shell_cmd)
      if cmd.any? { |c| c.to_s.include?("swiftformat") && !c.to_s.include?("--version") }
        $stderr.puts "[Cmd.run DEBUG] stdout=#{stdout.inspect}"
        $stderr.puts "[Cmd.run DEBUG] stderr=#{stderr.inspect}"
        $stderr.puts "[Cmd.run DEBUG] status=#{status.exitstatus.inspect}"
      end
      [stdout, stderr, status]
    end
  end
end
