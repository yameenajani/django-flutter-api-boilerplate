# Import models
from .models import Person
# import serializer
from rest_framework import serializers

class PersonSerializer(serializers.ModelSerializer):
  class Meta:
    model = Person
    fields = '__all__'