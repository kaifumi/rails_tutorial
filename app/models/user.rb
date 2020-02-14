class User < ApplicationRecord
    #before_saveコールバックにブロックを渡してメールを設定
    #downcaseメソッドで大文字にも対応
    #右式のselfは省略している。selfは現在のユーザーを表している
    # before_save {self.email=email.downcase}
    #「！」は破壊的メソッドで実行後はそのデータが保存される
    before_save {email.downcase!}
    validates(:name, presence: true, length:{maximum:50})
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(:email, presence: true, length:{maximum:255},
            format:{with: VALID_EMAIL_REGEX},
            #大文字も区別できるようになった
            uniqueness: {case_sentsitive: false})
    #ユーザーがセキュアなパスワードを持てるようになる
    #password属性とpassword_confirmation属性に対して、
    #強制的にバリデーションを行う
    has_secure_password
    validates :password, presence: true,length: {minimum: 6}
end
