class ParticipationMailer < ApplicationMailer
	default from: 'tantely@yopmail.com'
 
	def participation_email(user)
		    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
		    @user = user 

		    #on définit une variable @url qu'on utilisera dans la view d’e-mail
		    @url  = 'https://eventbritetantely.herokuapp.com/' 

		    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
		    mail(to: @user.email, subject: 'Vous venez de vous inscrire à un event !')
	end
end
