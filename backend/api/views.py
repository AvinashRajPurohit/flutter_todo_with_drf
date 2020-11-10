from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView

from todos.models import Todo
from .serializers import TodoSerializer


class ListTodo(ListCreateAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer


class DetailTodo(RetrieveUpdateDestroyAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer