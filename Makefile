all : 
		@docker-compose -f /Users/araiteb/Desktop/ince/inception/srcs/docker-compose.yml build
		@docker-compose -f /Users/araiteb/Desktop/ince/inception/srcs/docker-compose.yml up
down :
		docker-compose -f /Users/araiteb/Desktop/ince/inception/srcs/docker-compose.yml down

re : clean all

clean : down 
		sudo rm -rf ince/inception/srcs/volume/db/
		sudo rm -rf ince/inception/srcs/volume/wp/