from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import PersonViewset

router = DefaultRouter()
router.register('person', PersonViewset, basename='person')

app_name = 'app'
urlpatterns = [
    path('api/', include(router.urls)),
]
