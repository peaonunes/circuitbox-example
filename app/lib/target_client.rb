class TargetClient
  def initialize(speed:)
    @speed = speed
    @circuit = ::Circuitbox.circuit(
      :target_server,
      exceptions: [HTTP::TimeoutError],
      time_window: 5,
      volume_threshold: 2,
      sleep_window: 2
    )
  end

  attr_reader :speed, :circuit

  def call
    circuit.run(circuitbox_exceptions: false) do
      HTTP.timeout(0.1).get("http://localhost:4000/?speed=#{speed}").status
    end
  end
end
