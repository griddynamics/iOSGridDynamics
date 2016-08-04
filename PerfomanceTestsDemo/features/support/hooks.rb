Around() do |scenario, block|
    Timeout.timeout(60) do
        block.call
    end
end