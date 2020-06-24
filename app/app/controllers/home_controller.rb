class HomeController < ApplicationController
  def index
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i+1}"
      speed = 'fast' if i > 3
      TargetClient.new(speed: speed).call
    end

    render json: answers
  end

  def first_example
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i+1}"
      HTTP.get("http://localhost:4000/?speed=#{speed}").status
    end

    render json: answers
  end

  def second_example
    speed = params[:speed]

    answers = Array(0..9).map do |i|
      sleep(1)
      puts "Request number #{i+1}"
      HTTP.timeout(0.1).get("http://localhost:4000/?speed=#{speed}").status
    end

    render json: answers
  end
end
