eval s=%q[require "digest";puts Digest::SHA256.hexdigest("eval s=%q[#{s}]\n")]
