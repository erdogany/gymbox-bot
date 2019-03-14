echo "run scheduled job!"
echo "call google:"
curl https://www.google.com
echo "call gymbox:"
curl -i https://gymbox-ec.herokuapp.com/api/run?email=erdoganyusuf@gmail.com&password=utn8HhUgMLDY6fF
echo "done"