class Invitation < MailForm::Base

	attribute :name, 					:validate => false
	attribute :email, 				:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :city,    			:validate => false
	attribute :country,    		:validate => false
	attribute :living_city,   :validate => false
	attribute :year,    			:validate => false
	attribute :n_countries, 	:validate => false
	attribute :plans,    			:validate => false
	attribute :comments, 			:validate => false
	attribute :nickname, 			:captcha => true

def headers 
	{
	:subject => "Contact form",
	:to => "alejandroromo14@gmail.com",
	:cc => "aromo@innovaciondisruptiva.mx",
	:from => %("#{name}" <#{email}>)
	}
	end
end