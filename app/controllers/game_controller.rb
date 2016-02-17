class GameController < ApplicationController
  #try method runs for each guess
  def try
    #if a random number hasn't yet been set, find a random number between 1 and 100, and store it in an encrypted cookie
    if session[:random].nil?
      session[:random] = rand(100)
      #answer instance variable used for testing purposes
      @answer = session[:random].to_i
    end
    #assign the user input as an integer to the instance variable @guess
    @guess = params[:guess].to_i
    #if the user puts in an invalid guess
    if @guess <= 0 || @guess > 100
      @result = "Please enter a number between 1 and 100, bozo"
    #if the guess is less than the random number, set the result to "too low"
    elsif @guess < session[:random]
      @result = "Too Low, bozo"
    #otherwise, if the guess is greater than the random number, set the result to "too high"
    elsif @guess > session[:random]
      @result = "Too High, bozo"
    #otherwise, the guess is correct; set the result to "winner"
    else
      @result = ""
      @winningResult = "Winner!"
      #reset the encrypted cookie to nil, so that a new random number is generated with the next try
      session[:random] = nil
    end
  end
end
