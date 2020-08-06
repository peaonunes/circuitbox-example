class HomeController < ApplicationController
  def index
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i + 1}"
      speed = 'fast' if i > 3
      TargetClient.new(speed: speed).call
    end

    render json: answers
  end

  def without_timeout
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i + 1}"
      HTTP.get("http://localhost:4000/?speed=#{speed}").status
    end

    render json: answers
  end

  def with_timeout
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i + 1}"
      HTTP.timeout(0.1).get("http://localhost:4000/?speed=#{speed}").status
    end

    render json: answers
  end

  def default_circuit_breaker
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i + 1}"
      DefaultConfigClient.new(speed: speed).call
    end

    render json: answers
  end

  def custom_circuit_breaker
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i + 1}"
      CustomConfigClient.new(speed: speed).call
    end

    render json: answers
  end

  def recover_cb
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i + 1}"
      speed = 'fast' if i > 3
      CustomConfigClient.new(speed: speed).call
    end

    render json: answers
  end
end
