class User
    #@で定義したインスタンス変数にアクセスできるようになる
    attr_accessor :first_name, :last_name
  
    def initialize(attributes = {})
      @first_name  = attributes[:first_name]
      @last_name = attributes[:last_name]
    end
  
    def full_name
      "#{@first_name} #{@last_name}"
    end

    def alphabetical_name
      "#{@last_name}, #{@first_name}"
    end
  end