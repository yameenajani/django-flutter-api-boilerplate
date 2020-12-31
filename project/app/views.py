from django.shortcuts import render
from rest_framework import viewsets
from .serializers import PersonSerializer
from .models import Person
from rest_framework.permissions import IsAuthenticated

# Create your views here.
class PersonViewset(viewsets.ModelViewSet):
  permission_classes = [IsAuthenticated,]
  serializer_class = PersonSerializer
  queryset = Person.objects.all()