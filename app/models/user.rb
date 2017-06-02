require 'csv'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.to_csv
    attributes = %w{id email first_name last_name name}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
        
  def name
    "#{first_name} #{last_name}"
  end
       
  def self.insert_data file
  	CSV.foreach(file.path, :headers => true) do |row|
	  User.new(row.to_hash)
	  p row.to_hash
	end
  end 

end
